# Learn Terraform

This sets up Terraform, takes temporary slip notes, and allows me to experiment with the system.

## Setup Instance

The first example was to setup a basic instance. I created one, changed it, and destroyed it. I confirmed the system was in the state Terraform reported in the AWS console between steps.

I hadn't used the AWS CLI before, and I didn't have useful I AM Roles available. I created one, david, with programatic access and permissions for a data scientist. That may do the job. The information for all of that is stored in LastPass.

One thing that was surprising was that I would need to know the location-specific AMI before I could deploy an EC2 instance. It makes sense, but it's a tighter-abstraction to what I'm building than I thought. What that tells me is creating documentation, slips, and storing them in a git repo is critical.

## ML Plan

I'm going to be using a GPU on AWS for training my code. That means I'll create local port forwarding over SSH to connect port 8888 to a P2 instance that is ideal for building a deep learning module. In order to use a P2 instance, a limit increase must be setup. That's been done with Case ID 6728534471.

As I work through more of the Terraform documentation, I'll keep this in mind so I know how to store/use/lookup whatever I need.
