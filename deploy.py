#! /usr/bin/env python3

import argparse
import subprocess as sp

parser = argparse.ArgumentParser(description="Compiles and deploys my website.")
parser.add_argument("--cv", action="store_true", help="Whether to compile the CV.")
args = parser.parse_args()

if args.cv:
    sp.run("typst compile CV_Charih.typ static/charih_cv.pdf", shell=True)

sp.run("git add .", shell=True)
sp.run("git commit", shell=True)
sp.run("git push origin main", shell=True)
