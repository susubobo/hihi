import json
import urllib.request

# Get latest release of Hardware-Sniffer
url = "https://api.github.com/repos/lzhoang2801/Hardware-Sniffer/releases/latest"
req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
with urllib.request.urlopen(req) as resp:
    data = json.loads(resp.read().decode())

print(f"Release: {data['tag_name']}")
print(f"Name: {data['name']}")
for asset in data.get("assets", []):
    print(f"  Asset: {asset['name']} -> {asset['browser_download_url']}")
