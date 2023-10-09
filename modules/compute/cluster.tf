# root module で databricks provider を定義しても他の module に databricks provider が渡らない
# 原因はよく分からなかったので，各 module で databricks provider を定義することで対応した
terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.27.0"
    }
  }
}

data "databricks_node_type" "smallest" {
  # ここに Databricks 上で使用したい node の条件を記述する
  # 記述した条件に合致する最小の node が取得される

  # ここでは GPU を保持する最小の node を指定する
  category = "GPU Accelerated"
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
  gpu               = true
  ml                = true
}

resource "databricks_cluster" "shared_autoscaling" {
  cluster_name            = "Shared Autoscaling"
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 20
  autoscale {
    min_workers = 1
    max_workers = 2
  }
}
