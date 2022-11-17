#!/bin/bash

echo "BUILD"
workspace=`pwd`;
timestamp=`date +%Y%m%d%H%M%S`;
echo "L'espace de travail : $workspace"
echo""

echo "STAGE : PROVISIONNING"
cd infra
echo "########## TERRAFORM PLAN ##########"
if ! terraform plan; then
  exit 1
fi  
echo "########## TERRAFORM APPLY ##########"
if ! terraform apply -auto-approve; then
  exit 1
fi  
cd $workspace
echo ""
echo "STAGE : BUILD HELLO-BACK"
cd back/hello-api
echo "########## GENERATE JAR BY MAVEN ##########"
if ! mvn clean package -U; then
  exit 1
fi
echo "########## ZIP PACKAGE ##########"
if ! cp target/classes/Procfile target/; then
  exit 1
fi
cd target/ 
if ! zip hello-back.zip helloapi-0.0.5-SNAPSHOT.jar Procfile; then
  exit 1
fi
cd $workspace
echo ""

echo "STAGE : BUILD HELLO-FRONT"
echo "########## GENERATE BY NG ##########"
cd front/hello-world
if ! ng build; then 
  exit 1
fi
echo "########## ZIP PACKAGE ##########"
if ! cp -r dist server/; then
  exit 1
fi  
cd server 
if ! zip hello-front.zip -r dist/ server.js package.json; then
  exit 1
fi  
cd $workspace
echo ""

echo "STAGE : DEPLOY AWS HELLO-BACK"
echo "########## UPLOAD ON S3 ##########"
if ! aws s3 cp back/hello-api/target/hello-back.zip s3://hello-deployment-bucket/hello-back.${timestamp}.zip; then
  exit 1
fi  
echo "########## CREATE APP VERSION ##########"
if ! aws elasticbeanstalk create-application-version --application-name hello-back --version-label hello-back.${timestamp} --source-bundle S3Bucket="hello-deployment-bucket",S3Key="hello-back.${timestamp}.zip" --no-auto-create-application --process; then
  exit 1
fi  
echo "########## UPDATE ENVIRONMENT ##########"
if ! aws elasticbeanstalk update-environment --environment-name hello-back-env --version-label hello-back.${timestamp}; then
  exit 1
fi  
cd $workspace
echo ""

echo "STAGE : DEPLOY AWS HELLO-FRONT"
echo "########## UPLOAD ON S3 ##########"
if ! aws s3 cp front/hello-world/server/hello-front.zip s3://hello-deployment-bucket/hello-front.${timestamp}.zip; then
  exit 1
fi
echo "########## CREATE APP VERSION ##########"
if ! aws elasticbeanstalk create-application-version --application-name hello-front --version-label hello-front.${timestamp} --source-bundle S3Bucket="hello-deployment-bucket",S3Key="hello-front.${timestamp}.zip" --no-auto-create-application --process; then
  exit 1
fi
echo "########## UPDATE ENVIRONMENT ##########"
if ! aws elasticbeanstalk update-environment --environment-name hello-front-env --version-label hello-front.${timestamp}; then
  exit 1
fi  
cd $workspace
echo ""
echo "BUILD FINISHED"