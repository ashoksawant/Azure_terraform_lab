resource "azurerm_monitor_scheduled_query_rules_alert_v2" "paas_alert_rule" {
    name = var.name
    display_name = var.name
    resource_group_name = var.resource_group_name
    location = var.location
    criteria {
      operator = var.operator
      threshold = var.threshold
      time_aggregation_method = var.time_aggregation_method
      metric_measure_column = var.metric_measure_column
      resource_id_column = var.resource_id_column
      query = var.query
      failing_periods {
              minimum_failing_periods_to_trigger_alert = var.minimum_failing_periods
              number_of_evaluation_periods             = var.number_of_evaluation_periods
            }
    }
    scopes = var.scopes
    severity = var.severity
    evaluation_frequency = var.evaluation_frequency
    window_duration = var.window_duration
    description = var.description
    action {
        action_groups = var.action_group_id
    }
    enabled = var.enabled

}