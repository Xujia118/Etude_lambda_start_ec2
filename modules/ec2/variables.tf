variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t2.micro"    
}

variable "ami_id" {
    description = "Amazon Machine Image ID"
    type        = string
    default     = "ami-04dd23e62ed049936"  
}