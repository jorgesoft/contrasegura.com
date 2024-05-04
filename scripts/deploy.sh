#!/bin/bash

# Define the bucket name
BUCKET_NAME="contrasegura.com"

# Deploy S3 Bucket with parameter override for the bucket name
aws cloudformation deploy \
  --template-file templates/s3-template.yaml \
  --stack-name my-s3-bucket-stack \
  --parameter-overrides BucketName=${BUCKET_NAME} \
  --capabilities CAPABILITY_NAMED_IAM

# Upload the website to the S3 bucket
aws s3 cp src/website/index.html s3://${BUCKET_NAME}/index.html
aws s3 cp src/website/script.js s3://${BUCKET_NAME}/script.js