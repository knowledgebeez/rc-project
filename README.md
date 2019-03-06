# rcproject

Project to deploy a jenkins server with a job to deploy ELK stack

## Getting Started

These instructions will get you a Jenkins server and ELK stack running in AWS US-EAST-1 region. See deployment for notes on how to deploy the project.

### Prerequisites

AWS account with the ability to create cloudformation stacks and spin up ec2 instaces.

## Jenkins Deployment

Follow the steps below to deploy a Jenkins server:

```
git clone https://github.com/knowledgebeez/rc-project.git
```

```
aws cloudformation create-stack \
--stack-name Jenkins-Candidate-uGOEToMrtb \
--template-body file://./rc-project/cloudformation/jenkins_cft.yml \
--region us-east-1 \
--capabilities CAPABILITY_IAM
```

## ELK Stack Deployment

Follow the steps below to deploy an ELK Stack:

```
aws cloudformation describe-stacks --region us-east-1 --stack-name Jenkins-Candidate-uGOEToMrtb --profile rean --query 'Stacks[0].Outputs[1].OutputValue'
```

```
http://{PuplicIp}:8080
```

```
user: admin
pass: admin
```

```
Kick off the "ELK Stack Deployment" Jenkins job.

Note: Deployment of the ELK stack completes in 15 mins. 
```

```
Fetch the the public ip for the ELK stack from the Jenkins job log and access "Kibana" through a web browser. 
```


## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

