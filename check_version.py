import requests
import re

def get_latest_version():
    response = requests.get('https://pypi.org/pypi/keplergl/json')
    data = response.json()
    return data['info']['version']


def get_current_version():
    with open('Dockerfile', 'r') as file:
        content = file.read()
        match = re.search(r'keplergl==([\d.]+)', content)
        return match.group(1) if match else None


def update_dockerfile(new_version):
    with open('Dockerfile', 'r') as file:
        content = file.read()
    new_content = re.sub(
        r'version="[\d.]+"', f'version="{new_version}"', content)
    new_content = re.sub(
        r'keplergl==[\d.]+', f'keplergl=={new_version}', content)
    with open('Dockerfile', 'w') as file:
        file.write(new_content)


if __name__ == "__main__":
    latest_version = get_latest_version()
    current_version = get_current_version()

    new_version_found = latest_version != current_version
    if new_version_found:
        print(f"New version found: {latest_version}. Updating Dockerfile.")
        update_dockerfile(latest_version)

    # Set the output for GitHub Actions
    with open('version_output.txt', 'w') as f:
        f.write(f"new_version_found={str(new_version_found).lower()}\n")
        f.write(f"latest_version={latest_version}\n")
