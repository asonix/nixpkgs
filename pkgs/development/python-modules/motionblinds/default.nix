{ lib
, buildPythonPackage
, fetchFromGitHub
, pycryptodomex
, pythonOlder
}:

buildPythonPackage rec {
  pname = "motionblinds";
  version = "0.6.15";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "starkillerOG";
    repo = "motion-blinds";
    rev = "refs/tags/${version}";
    hash = "sha256-OTnlfJeE64tURR5YrTXjzTHbvGnbeEWu9UHGynzmSiQ=";
  };

  propagatedBuildInputs = [
    pycryptodomex
  ];

  # Project has no tests
  doCheck = false;

  pythonImportsCheck = [
    "motionblinds"
  ];

  meta = with lib; {
    description = "Python library for interfacing with Motion Blinds";
    homepage = "https://github.com/starkillerOG/motion-blinds";
    changelog = "https://github.com/starkillerOG/motion-blinds/releases/tag/${version}";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
