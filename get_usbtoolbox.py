import json
import urllib.request

url = "https://api.github.com/repos/USBToolBox/tool/releases/latest"
req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
with urllib.request.urlopen(req) as resp:
    data = json.loads(resp.read().decode())

print(f"Release: {data['tag_name']}")
for asset in data.get("assets", []):
    print(f"  {asset['name']} -> {asset['browser_download_url']}")
