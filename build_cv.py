#! /usr/bin/env python3

import subprocess as sp

from contentful import Client
import yaml

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


with open("temp_data.yaml", "w") as ofile:
    yaml.dump(data, ofile)

sp.run("typst compile CV_Charih.typ && rm temp_data.yaml", shell=True)
sp.run("cp CV_Charih.typ static/charih_cv.pdf", shell=True)
