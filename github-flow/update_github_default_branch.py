import argparse
import json
import os

import requests

access_token = os.environ.get("GITHUB_ACCESS_TOKEN")


def update_github_default_branch(branch_name):
    headers = {"Authorization": f"token {access_token}", "Content-Type": "application/json"}
    data = {"name": "knowledge-engine", "default_branch": branch_name}
    url = "https://api.github.com/repos/CognitionX/knowledge-engine"

    response = requests.patch(url, data=json.dumps(data), headers=headers)
    print(response)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("branch", action="store", type=str, help="The branch to make default.")
    args = parser.parse_args()
    if args.branch:
        update_github_default_branch(args.branch)
