import json
import requests

response = requests.get("https://x.wazirx.com/api/v2/global_configs")

if response.status_code ==200:
    json_response = response.json()
    name = []
    subname = []
    icon_link = []
    for i in range(0, 224):
        name.append(json_response["currencies"][i]["name"])
        subname.append(json_response["currencies"][i]["type"])
        icon_link.append(json_response["currencies"][i]["icon"].replace("<SIZE>", "84"))

    

print(icon_link[0])