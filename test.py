try:
    response = requests.get(
        url="{}{}".format(base_url,init_uri),
        params={
            "app_token": app_token,
            "user_token": user_token
        }
    )
    print('Response HTTP Status Code: {status_code}'.format(status_code=response.status_code))
    print('Response HTTP Response Body: {content}'.format(content=response.content))

    resp_json = response.json()
    session_token = resp_json['session_token']
    print(session_token)

    headers = {"Session-Token":session_token, "App-Token":app_token, "Content-Type": "application/json"}
   
    ticket_input = {"input": {"name": "TEST-TICKET4", "content": "DESCS"}}

    post_ticket = requests.post(url="{}{}".format(base_url,ticket_uri), headers=headers, data=json.dumps(ticket_input))

    print(post_ticket.content)

except requests.exceptions.RequestException as err:
    print('HTTP Request failed: ', err)