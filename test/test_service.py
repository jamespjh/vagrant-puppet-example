# Tests require the docker container to be running

def test_service():
    #connect to the web service
    #check we get the right number
    import requests
    import json
    url = "http://testws.ucl.ac.uk:8080/3"
    response = requests.get(url)
    doubled = json.loads(response.content)['result']
    assert doubled == 6
