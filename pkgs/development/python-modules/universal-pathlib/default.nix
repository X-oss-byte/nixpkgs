{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, setuptools-scm
, fsspec
, pythonOlder
}:

buildPythonPackage rec {
  pname = "universal-pathlib";
  version = "0.1.2";
  format = "pyproject";

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    pname = "universal_pathlib";
    inherit version;
    hash = "sha256-aJ4nAf717U7RmIjQrKCzVC/iSOCbEK3EMfX3R/hoBSo=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [
    fsspec
  ];

  pythonImportsCheck = [ "upath" ];

  meta = with lib; {
    description = "Pathlib api extended to use fsspec backends";
    homepage = "https://github.com/fsspec/universal_pathlib";
    changelog = "https://github.com/fsspec/universal_pathlib/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ figsoda ];
  };
}
