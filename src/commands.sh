#create an S3 bucket
aws s3 mb s3://naimat-sam-code

#package cloudformation to S3
aws cloudformation package --s3-bucket naimat-sam-code --template-file template.yaml --output-template-file gen/template-generate.yaml

#deploy to Cloudformation from S3
aws cloudformation deploy --template-file gen\template-generate.yaml --stack-name  hello-world-SAM --capabilities CAPABILITY_IAM

#init sam templete CICD 
sam init --location gh:aws-samples/cookiecutter-aws-sam-pipeline