#!/bin/bash

STACK_NAME=awsecommerce
REGION=us-east-1 
CLI_PROFILE=awsecommerce1

EC2_INSTANCE_TYPE=t2.micro


# Deploy the CloudFormation template
echo -e "\n\n=========== Deploying main.yml ==========="
aws cloudformation deploy \
  --region $REGION \
  --profile $CLI_PROFILE \
  --stack-name $STACK_NAME \
  --template-file main-ecommerce.yml \
  --no-fail-on-empty-changeset \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides \
    EC2InstanceType=$EC2_INSTANCE_TYPE \
   # GitHubOwner=$GH_OWNER \
   # GitHubRepo=$GH_REPO \
   # GitHubBranch=$GH_BRANCH \
   # GitHubPersonalAccessToken=$GH_ACCESS_TOKEN \
   # CodePipelineBucket=$CODEPIPELINE_BUCKET



       
if [ $? -eq 0 ]; then
  aws cloudformation list-exports \
    --profile awsecommerce1 \
    --query "Exports[?Name=='InstanceEndpoint'].Value" 
fi
