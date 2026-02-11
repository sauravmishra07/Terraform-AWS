variable "aws_instance_type" {
    description = "What type of instance you wnat to create"
    type = string
    
    validation {
      condition = var.aws_instance_type=="t3.micro" || var.aws_instance_type=="t3.nano"
      error_message = "only t3.micro and t2.nano allowed as instance type"
    }
}

variable "ec2_config" {
    type = object({
      v-size = number
      v-type = string
    })

    default = {
      v-size = 20
      v-type = "gp2"
    }
  
}

variable "additional-tag" {
    type = map(string)
    default = {}
  
}