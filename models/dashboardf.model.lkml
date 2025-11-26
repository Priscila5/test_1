connection: "afluencia_movilidad"

datagroup: dashboardf_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dashboardf_default_datagroup

