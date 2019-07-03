#!/usr/bin/env bash
set -e
pip uninstall -y conan_package_tools
# pip install conan --upgrade
# pip install --index-url https://test.pypi.org/simple/ conan==1.17.0.dev1560518880
git clone https://github.com/memsharded/conan.git --branch feature/lockfiles conan
pip install -e conan
git clone https://github.com/lasote/ci-conan-flows.git ci
pip install -r ci/requirements.txt
PYTHONPATH=$(pwd)/ci python ci/conan_ci/launch_single_job.py