#!/usr/bin/env bash
set -e
pip install conan --upgrade
pip install --index-url https://test.pypi.org/simple/ conan==1.17.0.dev1560518880
git clone git@github.com:lasote/ci-conan-flows.git ci
pip install -r ci/requirements.txt
PYTHONPATH=$(pwd)/ci python ci/conan_ci/launch_single_job.py