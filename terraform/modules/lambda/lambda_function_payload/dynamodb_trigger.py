import os
import boto3

dynamodb = boto3.resource('dynamodb')
s3 = boto3.client('s3')
table = dynamodb.Table(os.environ['VCARD_DYNAMODB_TABLE'])
bucket_name = os.environ['VCF_BUCKET_NAME']
email = os.environ['EMAIL']

def lambda_handler(event, context):
    for record in event['Records']:
        if record['eventName'] in ('INSERT', 'MODIFY'):
            item = table.get_item(Key={'id': record['dynamodb']['Keys']['id']['S']})['Item']
            vcard = create_vcard(item)
            object_key = f"vcards/{item['id']}.vcf"
            s3.put_object(Bucket=bucket_name, Key=object_key, Body=vcard)
            s3_link = f"https://{bucket_name}.s3.amazonaws.com/{object_key}"
            send_email(s3_link)

def send_email(s3_link):
    ses_client = boto3.client('ses')
    SENDER = f"VCard-Producer <{email}>"
    RECIPIENT = f"{email}"
    SUBJECT = "Your vCard File"
    BODY_TEXT = (f"Your vCard file is available at the following link: {s3_link}")
    CHARSET = "UTF-8"
    response = ses_client.send_email(
        Destination={'ToAddresses': [RECIPIENT]},
        Message={
            'Body': {'Text': {'Charset': CHARSET, 'Data': BODY_TEXT}},
            'Subject': {'Charset': CHARSET, 'Data': SUBJECT},
        },
        Source=SENDER
    )


def create_vcard(item):
    vcard_template = [
        "BEGIN:VCARD",
        "VERSION:3.0",
        "N:{};{};;;",
        "FN:{} {}",
        "TEL;TYPE=CELL:{}",
        "END:VCARD"
    ]

    vcard_content = "\n".join(vcard_template).format(
        item['lastName'],
        item['firstName'],
        item['firstName'],
        item['lastName'],
        item['phone']
    )

    return vcard_content
