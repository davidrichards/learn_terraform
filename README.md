# Learn Terraform

This sets up Terraform, takes temporary slip notes, and allows me to experiment with the system while I [work through the documentation](https://learn.hashicorp.com/terraform) and setup [the data lab](https://github.com/davidrichards/data_lab).

## Setup Instance

The first example was to setup a basic instance. I created one, changed it, and destroyed it. I confirmed the system was in the state Terraform reported in the AWS console between steps.

I hadn't used the AWS CLI before, and I didn't have useful I AM Roles available. I created one, david, with programatic access and permissions for a data scientist. That may do the job. The information for all of that is stored in LastPass.

One thing that was surprising was that I would need to know the location-specific AMI before I could deploy an EC2 instance. It makes sense, but it's a tighter-abstraction to what I'm building than I thought. What that tells me is creating documentation, slips, and storing them in a git repo is critical.

## ML Plan

I'm going to be using a GPU on AWS for training my code. That means I'll create local port forwarding over SSH to connect port 8888 to a P2 instance that is ideal for building a deep learning module. In order to use a P2 instance, a limit increase must be setup. That's been done with [Case ID 6728534471](https://console.aws.amazon.com/support/cases#/6728534471/en).

As I work through more of the Terraform documentation, I'll keep this in mind so I know how to store/use/lookup whatever I need.

I made a mistake, and need to get P instances in us-west-2 instead of us-west-1. They gave me the resources, but in the region I asked for, the wrong region. The new case is [6730418791](https://console.aws.amazon.com/support/cases#/6730418791/en).

## Dependencies

I created a separate directory for the dependencies, because I wanted to compare and think about things. This is not normal practice. Git is enough for that. Also, the `terraform init` command must be called in the new directory, which brings down a binary file for the provider. For AWS, that's 158M. Also, this confirms that I was right to ignore the `.terraform` directory in git.

There was an error setting up the Elastic IP address, which I think is tied to the permissions granted a data scientist with the I AM role I used, as that is not what a data scientist typically does. Either way, I destroyed the instances and left a clean slate once I got that far.

## Questions

* How can I stop or hybernate instances from Terraform?
* How can I interpret state to mean, "all shut down, you can go home now?"
* How can I integrate cost management and limitations with my practice?

