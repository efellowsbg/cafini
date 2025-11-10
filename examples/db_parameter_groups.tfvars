db_parameter_groups = {
  test_db_group = {
    family       = "mysql8.0"
    name         = "my-db-parameter-group"
    description  = "My custom DB parameter group"
    skip_destroy = false

    parameters = {
      character_set_server = {
        name  = "character_set_server"
        value = "utf8mb4"
      }

      max_connections = {
        name         = "max_connections"
        value        = "300"
        apply_method = "immediate"
      }

      slow_query_log = {
        name  = "slow_query_log"
        value = "1"
      }
    }
  }
}
