variable "region" {
  description = "AWS Deployment region.."
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC cidr block"
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Env name"
  default     = "dev"
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "public subnet cidr"
  default     = ["10.0.64.0/18", "10.0.0.0/18"]
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "private subnet cidr"
  default     = ["10.0.128.0/17"]
}

variable "availability_zones" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}

variable "alb_security_groups" {
  default = ["alb-security-group"]
}

variable "alb_tls_cert_arn" {
  default = "tls-cert-arn"
}