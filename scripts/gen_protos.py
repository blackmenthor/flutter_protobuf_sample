#! env python3

import os, subprocess, glob

proj_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
subprocess.run(
    'protoc --dart_out=lib/gen_protos ./protos/*.proto',
    shell=True, cwd=proj_dir
)