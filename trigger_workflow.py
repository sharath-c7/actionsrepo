import requests
import json
import os

# GitHub repository details
GITHUB_TOKEN = os.getenv('GITHUB_TOKEN')  # Set this in your environment
REPO_OWNER = "your-username"  # Replace with your GitHub username
REPO_NAME = "actionsrepo"  # Replace with your repository name

# API endpoint for repository dispatch
url = f"https://api.github.com/repos/{REPO_OWNER}/{REPO_NAME}/dispatches"

# Headers for authentication
headers = {
    "Accept": "application/vnd.github.v3+json",
    "Authorization": f"token {GITHUB_TOKEN}"
}

# Payload for the repository dispatch event
payload = {
    "event_type": "create_file",
    "client_payload": {
        "file_name": "example.txt",
        "file_content": "This is a test file created via repository dispatch!"
    }
}

# Make the API request
response = requests.post(url, headers=headers, data=json.dumps(payload))

# Check the response
if response.status_code == 204:
    print("Workflow triggered successfully!")
else:
    print(f"Failed to trigger workflow. Status code: {response.status_code}")
    print(f"Response: {response.text}") 