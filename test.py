import json

def handler(event, context):
	path = event['pathParameters']
	return {'statusCode': 200, 'body': json.dumps('Hello {}!'.format(path['user'].title()))}
