import json
import requests

response = requests.get("https://x.wazirx.com/wazirx-falcon/api/v2.0/crypto_rates")

if response.status_code ==200:
    json_response = response.json()
    # print(json_response)
    name = []
    subname = []
    # icon_link = []
    for i in range(0, 50):
        name.append(json_response)
        subname.append(json_response[i]["inr"])
    #     icon_link.append(json_response["currencies"][i]["icon"].replace("<SIZE>", "84"))


print(name)
    

# print(icon_link[0])