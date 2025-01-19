# These are the providers and the regions we are using to expand Tokyo Midtown Medical Center's 
# services worldwide 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"

  cloud {

    organization = "Hungry-Wolves"

    workspaces {
      name = "Armageddon"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
  alias  = "Tokyo"
}

provider "aws" {
  region = "ap-east-1"
  alias  = "Hong-Kong"
}
provider "aws" {
  region = "eu-west-2"
  alias  = "London"
}

provider "aws" {
  region = "sa-east-1"
  alias  = "Sao-Paulo"
}

provider "aws" {
  region = "us-west-1"
  alias  = "California"
}

provider "aws" {
  region = "ap-southeast-2"
  alias  = "Australia"
}

provider "aws" {
  region = "us-east-1"
  alias  = "New-York"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
