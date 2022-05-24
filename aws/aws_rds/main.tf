resource "aws_rds_cluster" "this" {
  # Notes:
  # iam_roles has been removed from this resource and instead will be used with aws_rds_cluster_role_association below to avoid conflicts per docs
  cluster_identifier                  = var.db_cluster_name
  engine                              = var.engine
  engine_mode                         = var.engine_mode
  database_name                       = var.database_name
  master_username                     = var.master_username
  master_password                     = var.master_password
  final_snapshot_identifier           = var.final_snapshot_identifier == null ? "${var.db_cluster_name}-final-snpshot" : var.final_snapshot_identifier
  skip_final_snapshot                 = var.skip_final_snapshot
  deletion_protection                 = var.deletion_protection
  backup_retention_period             = var.backup_retention_period
  port                                = var.port
  db_subnet_group_name                = var.db_subnet_group_name
  vpc_security_group_ids              = var.vpc_security_group_ids
  copy_tags_to_snapshot               = var.copy_tags_to_snapshot

  dynamic "scaling_configuration" {
    for_each = [var.scaling_configuration]

    content {
      auto_pause               = lookup(scaling_configuration.value, "auto_pause", null)
      max_capacity             = lookup(scaling_configuration.value, "max_capacity", null)
      min_capacity             = lookup(scaling_configuration.value, "min_capacity", null)
      seconds_until_auto_pause = lookup(scaling_configuration.value, "seconds_until_auto_pause", null)
      timeout_action           = lookup(scaling_configuration.value, "timeout_action", null)
    }
  }

  tags = var.tags
}


# resource "aws_rds_cluster" "db_cluster" {
#     cluster_identifier  = var.db_cluster_name
#     engine                              = var.engine
#     engine_mode                         = var.engine_mode
#     engine_version                      = var.engine_version
#     serverlessv2_scaling_configuration  {
#       max_capacity = var.max_capacity
#       min_capacity = var.min_capacity
#     }
#     db_subnet_group_name                = var.db_subnet_group_name
#     vpc_security_group_ids              = var.vpc_security_group_ids
#     database_name                       = var.database_name 
#     master_username                     = var.master_username 
#     master_password                     = var.master_password
#     backup_retention_period             = var.backup_retention_period
#     preferred_maintenance_window        = var.preferred_maintenance_window
#     preferred_backup_window             = var.preferred_backup_window
#     port                                = var.port
#     copy_tags_to_snapshot               = var.copy_tags_to_snapshot
#     deletion_protection                 = var.deletion_protection
# }