module "app_service_cpu" {
  source = "./paaslogv2alert"
  resource_group_name = "PaaS-Diagnostic"
  location = "East US"
  name = "app_servicecpu_alert"
  operator = "GreaterThanOrEqual"
  threshold = 0
  time_aggregation_method = "Average"
  metric_measure_column = "Result"
  resource_id_column = "_ResourceId"
  query = <<-QUERY
AzureMetrics
| where MetricName == 'CpuPercentage' and ResourceId contains 'MICROSOFT.WEB/SERVERFARMS' 
| summarize Result=avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
  scopes = ["/subscriptions/fb63f824-3311-4bd9-bd21-54708346da51/resourcegroups/paas-diagnostic/providers/microsoft.operationalinsights/workspaces/diagnostictesting"]
  severity = 2
  evaluation_frequency = "PT15M"
  window_duration = "PT15M"
  namespace = "Microsoft.OperationalInsights/workspaces"
  description = "Alert for app service CPU based on AzureMetrics"
  action_group_id = ["/subscriptions/FB63F824-3311-4BD9-BD21-54708346DA51/resourceGroups/PaaS-Diagnostic/providers/microsoft.insights/actionGroups/paas-actiongroup"]
}
module "SQLdb_cpu" {
  source = "./paaslogv2alert"
  resource_group_name = "PaaS-Diagnostic"
  location = "East US"
  name = "sqldbCPU"
  operator = "GreaterThanOrEqual"
  threshold = 0
  time_aggregation_method = "Average"
  metric_measure_column = "Result"
  resource_id_column = "_ResourceId"
  query = <<-QUERY
AzureMetrics
| where MetricName == "cpu_percent" and ResourceId contains "MICROSOFT.SQL/SERVERS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
  scopes = ["/subscriptions/fb63f824-3311-4bd9-bd21-54708346da51/resourcegroups/paas-diagnostic/providers/microsoft.operationalinsights/workspaces/diagnostictesting"]
  severity = 2
  evaluation_frequency = "PT15M"
  window_duration = "PT15M"
  namespace = "Microsoft.OperationalInsights/workspaces"
  description = "Alert for sql db CPU based on AzureMetrics"
  action_group_id = ["/subscriptions/FB63F824-3311-4BD9-BD21-54708346DA51/resourceGroups/PaaS-Diagnostic/providers/microsoft.insights/actionGroups/paas-actiongroup"]
}