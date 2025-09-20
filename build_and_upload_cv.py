#! /usr/bin/env python3

import time
import subprocess as sp

from contentful import Client
from contentful_management import Client as ClientM
import yaml

management_key = open(".env").read().splitlines()[-1].split("=")[-1]

client = Client(
    "h10co4b8nw83",
    "q16uoVYBvpaF_eY3xst4IBRwzc3Yi6wWHNRvooKWeug",
    environment="master",  # Optional - it defaults to 'master'.
)

entries = client.entries()

# Group by entry types

data = {
    "degrees": [
        entry.fields() for entry in entries if entry.content_type.id == "education"
    ],
    "job": [entry.fields() for entry in entries if entry.content_type.id == "job"],
    "presentationList": [
        entry.fields() for entry in entries if entry.content_type.id == "presentation"
    ],
    "publicationList": [
        entry.fields() for entry in entries if entry.content_type.id == "publication"
    ],
    "awardList": [
        entry.fields() for entry in entries if entry.content_type.id == "award"
    ],
    "peerReviewList": [
        entry.fields() for entry in entries if entry.content_type.id == "peerReview"
    ],
    "communityActivities": [
        entry.fields()
        for entry in entries
        if entry.content_type.id == "communityInvolvement"
    ],
    "softwareList": [
        entry.fields()
        for entry in entries
        if entry.content_type.id == "softwareAndWebTools"
    ],
    "posterList": [
        entry.fields() for entry in entries if entry.content_type.id == "poster"
    ],
    "mentoringList": [
        entry.fields() for entry in entries if entry.content_type.id == "mentoring"
    ],
}


with open("cv.yaml", "w") as ofile:
    yaml.dump(data, ofile)

# sp.run("typst compile CV_Charih.typ && rm temp_data.yaml", shell=True)
sp.run("typst compile CV_Charih.typ", shell=True)
sp.run("cp CV_Charih.pdf static/charih_cv.pdf", shell=True)

client = ClientM(management_key)
new_upload = client.uploads("h10co4b8nw83").create(open("CV_Charih.pdf", "rb"))

print("Upload...")
asset_id = "charih_cv"  # Use `None` if you want the API to autogenerate the ID.
asset = client.assets("h10co4b8nw83", "master").create(
    asset_id,
    {
        "fields": {
            "title": {"en-US": "Charih CV"},
            "file": {
                "en-US": {
                    "contentType": "application/pdf",
                    "fileName": "CV_Charih.pdf",
                    "uploadFrom": new_upload.to_link().to_json(),
                }
            },
        }
    },
)

print("Process request...")
asset.process()

# it might take a few seconds for the asset processing to complete
while asset.url is None:
    print("Waiting for processing...")
    time.sleep(1)
    asset.reload()

print("Publish CV...")
asset = client.assets("h10co4b8nw83", "master").find("charih_cv")
asset.reload().publish()

