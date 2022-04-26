import requests

#This script should set up a session using an access token Oauth2
#Need to set up Oauth2 Pipeline first and invoke see ./src/oauth2


session = requests.Session()
session.headers.update({'Authorization': 'Bearer {access_token}'})
response = session.get('https://httpbin.org/headers')


