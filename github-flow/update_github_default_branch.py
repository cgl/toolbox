import argparse
import json
import os

import requests

access_token = os.environ.get("GITHUB_ACCESS_TOKEN")


def update_github_default_branch(branch_name, repo_url):
    headers = {"Authorization": f"token {access_token}", "Content-Type": "application/json"}
    data = {"name": "knowledge-engine", "default_branch": branch_name}

    response = requests.patch(repo_url, data=json.dumps(data), headers=headers)
    print(response)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("branch", action="store", type=str, help="The branch to make default.")
    parser.add_argument("repo_url", action="store", type=str, help="Url to repository.")
    args = parser.parse_args()
    if args.repo_url:
        repo_url = "https://api.github.com/repos/CognitionX/knowledge-engine"
    if args.branch:
        update_github_default_branch(args.branch, repo_url)
