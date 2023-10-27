variable "region" {
  description = "AWS region to deploy resources in"
  default     = "ap-southeast-2"
}
variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the EC2 instance."
  type        = string
  default     = "ami-09b402d0a0d6b112b"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch (e.g., t2.micro, t3.small)."
  type        = string
  default     = "t3.small"
}
