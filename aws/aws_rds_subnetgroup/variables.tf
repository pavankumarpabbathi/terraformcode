variable "db_subnet_group_name" {
    type = string
    description = "rds db subnetgroup name"
}

variable "subnet_ids" {
    type = list(any)
    description = "id of subnets to be present in db subnetgroup"
}

variable "db_subnet_group_description" {
    type = string
    description = "The description of the DB subnet group"
}