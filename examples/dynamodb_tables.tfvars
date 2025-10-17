dynamodb_tables = {
  example_table = {
    name     = "caf-example-table"
    hash_key = "id"
    # range_key      = "timestamp"
    billing_mode   = "PROVISIONED"
    read_capacity  = 5
    write_capacity = 5

    attribute = {
      name = "id"
      type = "S"
    }

    # attribute = {
    #   name = "timestamp"
    #   type = "N"
    # }

    point_in_time_recovery = {
      enabled = true
    }

    server_side_encryption = {
      enabled     = true
      kms_key_ref = "kms_key_test"
    }

    ttl = {
      attribute_name = "expires_at"
      enabled        = true
    }
  }
}
