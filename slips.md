Infrastructure as code allows us to setup repeatable, readable, and planning systems.

A provider block is the beginning, including the access key and secret key. The resource block identifies what we want to create, using a type and id. Inside the block is required and otional information to set things up.

Hashicorp. (n.d.). Introduction to Infrastructure as Code with Terraform | Terraform—HashiCorp Learn. Retrieved January 7, 2020, from https://learn.hashicorp.com/terraform/getting-started/intro

To install, get an installation link from teraform.io. [There is also a homebrew approach, which I used instead.]

Hashicorp. (n.d.). Installing Terraform | Terraform—HashiCorp Learn. Retrieved January 7, 2020, from https://learn.hashicorp.com/terraform/getting-started/install

Configuration is setup in configuration files. If generating configuration files, JSON can be used instead. By setting up the aws console, credentials, and an I AM Role, I should be able to deploy resources to AWS. Once that is setup, most of the work is developing configuration files.

When working with these files, organize them by directories. Terraform will load all terraform configuration in the local directory when working.

In the provider block, it has a name (aws), a profile (referring to an entry in ~/.aws/credentials), and a region. Multiple provider blocks can be configured if they are needed for the resources.

Resources can be physical, like an EC2 instance, or logical, like a Heroku application. Resources take two strings, one for the type, and the other for the id. The providers reference documents what is used in every block.

Use `terraform init` to setup the local settings. This reads the configuration in the local directory to know what to setup. Everything is written in a local .terraform directory. To maintain formatting and validation, use `terraform fmt`.

[At this point I started using git. I decided to ignore the .terraform directory, just in case there's anything in there that's not portable. This means the local user would have to init the configurations and work with them.]

Using `terraform plan` is no longer required (after Terraform 0.11). What it does is produce instructions for what to run. If I run `terraform plan` without an `-out` parameter, it just shows me the plan. I can also save those instructions to guarantee that a `terraform apply` uses the same plan as the one I reviewed.

The `terraform apply` command first shows the plan and requires I confirm it. I can safely back out at this point if I'd like. Typing yes, I get the instance deployed. It also writes a terraform.tfstate that has ids in it. This is a fairly readable file normally. The `terraform show` command will show it as well. The `terraform state` command can show how to manage the state of systems.

By changing the configuration, Terraform can change the underlying instance. By removing it, Terraform will remove resources. The `terraform destroy` command will destroy all resources setup in the configuration.

Hashicorp. (n.d.). Build Infrastructure | Terraform—HashiCorp Learn. Retrieved January 7, 2020, from https://learn.hashicorp.com/terraform/getting-started/build

By creating a second resource, I can create a dependency between resources. In this case it's an Elastic IP address. Terraform is inferring when a resource depends on another with the aws_instance.example.id implicit dependency. This creates the order to create the resources. This is the primary way to setup relationships, by inferrence, but if something isn't clear, the `depends_on` argument can be supplied to a resource to create an explicit dependency. One way this could be done would be if an S3 bucket is a dependency, but that is setup inside the code.

We can also add non-dependent resources as usual.

Hashicorp. (n.d.). Resource Dependencies | Terraform—HashiCorp Learn. Retrieved January 7, 2020, from https://learn.hashicorp.com/terraform/getting-started/dependencies

[TODO: work through Elastic IP Address]

AWS. (n.d.). Elastic IP Addresses—Amazon Elastic Compute Cloud. Retrieved January 7, 2020, from https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html

