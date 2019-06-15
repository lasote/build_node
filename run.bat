if not exist "C:/Python37/" choco install python --version 3.7.2
set PATH=c:/python37/Scripts;c:/python37/;%PATH%
set PYTHON=C:/Python37/python.exe
set PIP=C:/Python37/Scripts/pip.exe
%PIP% uninstall -y conan_package_tools || goto :error
%PIP% install conan --upgrade || goto :error
%PIP% install --index-url https://test.pypi.org/simple/ conan==1.17.0.dev1560518880 || goto :error
git clone https://github.com/lasote/ci-conan-flows.git ci || goto :error
%PIP% install -r ci/requirements.txt || goto :error
set PYTHONPATH=%cd%\ci
python ci/conan_ci/launch_single_job.py || goto :error

:error
echo Failed with error #%errorlevel%.
exit /b %errorlevel%