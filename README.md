# rcproject

Project to deploy a jenkins server with a job to deploy ELK stack

## Getting Started

These instructions will get you a Jenkins server and ELK stack running in AWS US-EAST-1 region. See deployment for notes on how to deploy the project.

### Prerequisites

AWS account with the ability to create cloudformation stacks and spin up ec2 instaces.

## Jenkins Deployment

Follow the steps below to deploy a Jenkins server:

1. Clone the rc-project git repo:
```
git clone https://github.com/knowledgebeez/rc-project.git
```

2. Run AWS CLI command to launch the Jenkins server:
```
aws cloudformation create-stack \
--stack-name Jenkins-Candidate-uGOEToMrtb \
--template-body file://./rc-project/cloudformation/jenkins_cft.yml \
--region us-east-1 \
--capabilities CAPABILITY_IAM
```

## ELK Stack Deployment

Follow the steps below to deploy an ELK Stack:

1. Get the public ip address of the Jenkins server:
```
aws cloudformation describe-stacks --region us-east-1 --stack-name Jenkins-Candidate-uGOEToMrtb --profile rean --query 'Stacks[0].Outputs[1].OutputValue'
```

2. Access Jenkins on port 8080:
```
http://{PuplicIp}:8080
```

3. Log into Jenkins with username/pass
```
user: admin
pass: admin
```

4. Kick off the "ELK Stack Deployment" Jenkins job:
```
Note: Deployment of the ELK stack completes in 15 mins. 
```

5. Get the ELK Stack Public Ip address:
```
Fetch the the public ip for the ELK stack from the Jenkins job log and access "Kibana" through a web browser. 
```

