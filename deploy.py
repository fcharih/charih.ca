#! /usr/bin/env python3

import argparse
import subprocess as sp

parser = argparse.ArgumentParser(description="Compiles and deploys my website.")
parser.add_argument("--cv", action="store_true", help="Whether to compile the CV.")
args = parser.parse_args()

if args.cv:
    sp.run("cd resume && typst compile CV_Charih.typ", shell=True)
    sp.run("cp resume/CV_Charih.pdf static/charih_cv.pdf", shell=True)

sp.run("git add .", shell=True)
sp.run("git commit", shell=True)
sp.run("git push origin main", shell=True)
sp.run("npm run build", shell=True)
sp.run("cp CNAME build", shell=True)
sp.run("node ./node_modules/gh-pages/bin/gh-pages -d build", shell=True)
