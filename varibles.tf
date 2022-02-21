variable "ami"{
 type = string
  default = "ami-0da123eacbbba5f18"
}
variable "keyname"{
  default = "Naincypem"
}
variable "region" {
  type        = string
  default     = "eu-west-3"
  description = "default region"
}

variable "vpc_cidr" {
  type        = string
  description = "default vpc_cidr_block"
}

variable "pub_sub1_cidr_block"{
   type        = string
}

variable "pub_sub2_cidr_block"{
   type        = string
}
variable "prv_sub1_cidr_block"{
   type        = string
}
variable "prv_sub2_cidr_block"{
   type        = string
}

variable "az1"{
   type        = string
}
variable "az2"{
   type        = string
}

variable "sg_name"{
 type = string
 default = "alb_sg"
}

variable "sg_description"{
 type = string
 default = "SG for application load balancer"
}

variable "sg_tagname"{
 type = string
 default = "SG for ALB"
}

variable "sg_ws_name"{
 type = string
 default = "webserver_sg"
}

variable "sg_ws_description"{
 type = string
 default = "SG for web server"
}

variable "sg_ws_tagname"{
 type = string
 default = "SG for web"
}

