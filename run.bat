%PIP% uninstall -y conan_package_tools
%PIP% install conan --upgrade
%PIP% install --index-url https://test.pypi.org/simple/ conan==1.17.0.dev1560518880
git clone https://github.com/lasote/ci-conan-flows.git ci
%PIP% install -r ci/requirements.txt
PYTHONPATH=$(pwd)/ci python ci/conan_ci/launch_single_job.py