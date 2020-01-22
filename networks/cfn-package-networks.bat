@ECHO OFF
REM cfn-package-networks.bat [Product ID] [Template File]
REM
REM

SET TODAY=%DATE:~-10,4%%DATE:~-5,2%%DATE:~-2%
SET MINUTE=%TIME:~0,2%%TIME:~3,2%
SET MINUTE=%MINUTE: =0%

SET REGION=ap-northeast-1
SET BUCKET={BUCKET-NAME}
SET LOCATION=securestack//%1/%TODAY%-%MINUTE%

REM S3 Bucket Access Role
SET PROFILE={AWS CLI IAM Profile Name}

REM CloudFormation Template File
SET LOCALTEMPLATE=%2
SET PACKAGEFILE=cfn-%1.yaml

REM Packaging and Deployment
aws cloudformation package --profile %PROFILE% --template-file "%LOCALTEMPLATE%" --s3-bucket %BUCKET% --s3-prefix "%LOCATION%" --output-template-file "%PACKAGEFILE%"

if exist "%PACKAGEFILE%" (
    aws s3 cp --profile %PROFILE% "%PACKAGEFILE%" "s3://%BUCKET%/%LOCATION%/%PACKAGEFILE%"
    del "%PACKAGEFILE%"

    REM Show Package File Path
    echo Package file is https://%BUCKET%.s3-%REGION%.amazonaws.com/%LOCATION%/%PACKAGEFILE%
) else (
    echo Packaging Error.
)
