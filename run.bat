set PATH=c:/python37/Scripts;c:/python37/;%PATH%
set PYTHON=C:/Python37/python.exe
set PIP=C:/Python37/Scripts/pip.exe
%PIP% uninstall -y conan_package_tools
%PIP% install conan --upgrade
%PIP% install --index-url https://test.pypi.org/simple/ conan==1.17.0.dev1560518880
git clone https://github.com/lasote/ci-conan-flows.git ci
%PIP% install -r ci/requirements.txt
set PYTHONPATH=%cd%/ci python ci/conan_ci/launch_single_job.py