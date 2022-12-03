variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "storage" {
  description = "Storage capacity in GB"
  type        = number
}

variable "family" {
  description = "The database family to use"
  type        = string
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "major_engine_version" {
  description = "The major engine version to use"
  type        = string
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
}

variable "password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
}

variable "default_tags" {
  description = "Default Tags"
  type = map(string)
}

variable "name" {
  description = "Name of the database"
  type        = string
}

variable "identifier" {
  description = "Identifier of the RDS instance"
  type        = string
}

variable "visibility" {
  description = "Visibility of the rds instance"
  type        = string
}

variable "snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  type        = string
  default     = null
}

variable "storage_encrypted" {
  description = "Encrypt data at rest"
  type        = bool
}

variable "storage_type" {
  description = "Storage type"
  type        = string
}

variable "multi_az" {
  description = "Enable multi az"
  type        = bool
}

variable "max_allocated_storage" {
  description = "Max allocated storage for db, in GB"
  type        = number
}

variable "iops" {
  description = "Provisioned IOPS"
  type        = number
}

variable "performance_insights_enabled" {
  description = "Enable Performance Insights"
  type        = bool
}

variable "vpc" {
  description = "All vpc info"
  type = object({
    vpc_id   = string
    database_subnets = list(string)
    vpc_cidr_block = string
  })
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  type        = bool
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
}

variable "copy_tags_to_snapshot" {
  description = "On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)"
  type        = bool
}

variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = bool
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  type        = bool
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  type        = bool
}

variable "performance_insights_retention_period" {
  description = "The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years)."
  type        = number
}