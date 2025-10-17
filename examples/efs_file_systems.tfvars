efs_file_systems = {
  efs_test = {
    creation_token   = "efs-test"
    performance_mode = "maxIO"
    throughput_mode  = "elastic"
    encrypted        = false
    tags = {
      Environment = "test"
      Name        = "efs-test"
    }
  }
}
