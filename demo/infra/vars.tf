variable "bucket_name" {
  default = "hello-deployment-bucket"
}
variable "elasticapp_back" {
  default = "hello-back"
}
variable "beanstalkappenv_back" {
  default = "hello-back-env"
}
variable "solution_stack_name_back" {
  type = string
}
variable "elasticapp_front" {
  default = "hello-front"
}
variable "beanstalkappenv_front" {
  default = "hello-front-env"
}
variable "solution_stack_name_front" {
  type = string
}
variable "tier" {
  type = string
}
variable "instance_type" {
  type = string  
} 
variable "minsize" {
    type = number
}    
variable "maxsize" {
    type = number
}    
variable "vpc_id" {}
variable "public_subnets" {}
variable "elb_public_subnets" {}