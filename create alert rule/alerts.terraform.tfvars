alerts = {

  SQLdb_cpu_1 = {
    name                         = "SQLdb_cpu"
    operator                     = "GreaterThan"
    threshold                    = 90
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "cpu_percent" and ResourceId contains "MICROSOFT.SQL/SERVERS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Alert for sql db CPU based on Azure Metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  app_service_cpu_2 = {
    name                         = "app_service_cpu"
    operator                     = "GreaterThan"
    threshold                    = 90
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == 'CpuPercentage' and ResourceId contains 'MICROSOFT.WEB/SERVERFARMS' 
| summarize Result=avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 1
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Alert for app service CPU based on Azure Metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  app_service_disk_queue_length_3 = {
    name                         = "app_service_disk_queue_length"
    operator                     = "GreaterThan"
    threshold                    = 15
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == 'DiskQueueLength' and ResourceId contains 'MICROSOFT.WEB/SERVERFARMS' 
| summarize Result=sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Alert for app service DiskQueueLength based on Azure Metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  app_service_http_queue_length_4 = {
    name                         = "app_service_http_queue_length"
    operator                     = "GreaterThan"
    threshold                    = 15
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == 'HttpQueueLength' and ResourceId contains 'MICROSOFT.WEB/SERVERFARMS' 
| summarize Result=avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Alert for app service HttpQueueLength based on Azure Metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  app_service_memory_5 = {
    name                         = "app_service_memory"
    operator                     = "GreaterThan"
    threshold                    = 90
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics 
| where TimeGenerated >= ago(15m)
| where MetricName == 'MemoryPercentage' and ResourceId contains 'MICROSOFT.WEB/SERVERFARMS' 
| summarize Result=avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 1
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Alert for app service memory based on Azure Metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  app_service_http401_6 = {
    name                         = "app_service_http401"
    operator                     = "GreaterThan"
    threshold                    = 50
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == 'Http401' and ResourceId contains 'MICROSOFT.WEB/SITES' 
| summarize Result=sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT1M"
    window_duration              = "PT5M"
    description                  = "Alert for app service Http 401 based on Azure Metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  app_service_Http5XX_7 = {
    name                         = "app_service_Http5XX"
    operator                     = "GreaterThan"
    threshold                    = 15
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == 'Http5xx' and ResourceId contains 'MICROSOFT.WEB/SITES' 
| summarize Result=sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT1M"
    window_duration              = "PT5M"
    description                  = "Alert for app service Http 5XX. The count of requests resulting in an HTTP status code = 500 but < 600."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  app_service_HttpResponseTime_8 = {
    name                         = "app_service_HttpResponseTime"
    operator                     = "GreaterThan"
    threshold                    = 10
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == 'HttpResponseTime' and ResourceId contains 'MICROSOFT.WEB/SITES' 
| summarize Result=avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT1M"
    window_duration              = "PT5M"
    description                  = "Alert for app service Http Response Time based on Azure metric. The time taken for the app to serve requests, in seconds."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  app_service_Requests_9 = {
    name                         = "app_service_Requests"
    operator                     = "GreaterThan"
    threshold                    = 1000
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == 'Requests' and ResourceId contains 'MICROSOFT.WEB/SITES' 
| summarize Result=sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT1M"
    window_duration              = "PT5M"
    description                  = "Alert for app service requests based on Azure metric. The total number of requests regardless of their resulting HTTP status code."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  app_service_Http404_10 = {
    name                         = "app_service_Http404"
    operator                     = "GreaterThan"
    threshold                    = 15
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == 'Http404' and ResourceId contains 'MICROSOFT.WEB/SITES' 
| summarize Result=sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 1
    evaluation_frequency         = "PT1M"
    window_duration              = "PT5M"
    description                  = "Alert for app service Http 404 based on Azure metric. The count of requests resulting in HTTP 404 status code."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  app_service_HealthCheckStatus_11 = {
    name                         = "app_service_HealthCheckStatus"
    operator                     = "GreaterThan"
    threshold                    = 5
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == 'HealthCheckStatus' and ResourceId contains 'MICROSOFT.WEB/SITES' 
| summarize Result=avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 1
    evaluation_frequency         = "PT1M"
    window_duration              = "PT5M"
    description                  = "Alert for app service Http 404 based on Azure metric. The count of requests resulting in HTTP 404 status code."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  SQLdb_blocked_by_firewall_12 = {
    name                         = "SQLdb_blocked_by_firewall"
    operator                     = "GreaterThan"
    threshold                    = 10
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == "blocked_by_firewall" and ResourceId contains "MICROSOFT.SQL/SERVERS"
| summarize Result= sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT1M"
    window_duration              = "PT5M"
    description                  = "Alert for sql db Blocked by Firewall based on Azure Metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  SQLdb_connection_failed_13 = {
    name                         = "SQLdb_connection_failed"
    operator                     = "GreaterThan"
    threshold                    = 20
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == "connection_failed" and ResourceId contains "MICROSOFT.SQL/SERVERS"
| summarize Result= sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT1M"
    window_duration              = "PT5M"
    description                  = "Alert for sql db Blocked by Firewall based on Azure Metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  SQLdb_dtu_consumption_percent_14 = {
    name                         = "SQLdb_dtu_consumption_percent"
    operator                     = "GreaterThan"
    threshold                    = 90
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "dtu_consumption_percent" and ResourceId contains "MICROSOFT.SQL/SERVERS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Alert for sql db DTU Percentage. Applies to DTU-based databases."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  SQLDatabaseDWUpercentage_16 = {
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "dwu_consumption_percent" and ResourceId contains "MICROSOFT.SQL/SERVERS"
| summarize Result= max(Maximum) by Resource, _ResourceId, bin(TimeGenerated, 15m)
 QUERY
    name                         = "SQLDatabase_DWU_percentage"
    time_aggregation_method      = "Maximum"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 90
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    severity                     = 2
    description                  = "DWU percentage. Applies only to data warehouses."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  SQLDatabase_Memory_percentage_17 = {
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "memory_usage_percent" and ResourceId contains "MICROSOFT.SQL/SERVERS"
| summarize Result= max(Maximum) by Resource, _ResourceId, bin(TimeGenerated, 15m)
QUERY
    name                         = "SQLDatabase_Memory_percentage"
    time_aggregation_method      = "Maximum"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 90
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    severity                     = 2
    description                  = "Memory percentage. Applies only to data warehouses."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  SQLDatabase_Data_space_used_percent_18 = {

    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "storage_percent" and ResourceId contains "MICROSOFT.SQL/SERVERS"
| summarize Result = max(Maximum) by Resource, _ResourceId, bin(TimeGenerated, 15m)
QUERY
    name                         = "SQLDatabase_Data_space_used_percent"
    time_aggregation_method      = "Maximum"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 90
    evaluation_frequency         = "PT5M"
    window_duration              = "PT5M"
    severity                     = 1
    description                  = "Data space used percent. Not applicable to data warehouses or hyperscale databases."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  SQLDatabase_Local_tempdb_percentage_19 = {

    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == "local_tempdb_usage_percent" and ResourceId contains "MICROSOFT.SQL/SERVERS"
| summarize Result = avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 5m)
QUERY
    name                         = "SQLDatabase_Local_tempdb_percentage"
    time_aggregation_method      = "Average"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 90
    evaluation_frequency         = "PT5M"
    window_duration              = "PT5M"
    severity                     = 1
    description                  = "Local tempdb percentage. Applies only to data warehouses."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  SQLDatabase_Log_IO_percentage_20 = {

    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == "log_write_percent" and ResourceId contains "MICROSOFT.SQL/SERVERS"
| summarize Result = avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 5m)
QUERY
    name                         = "SQLDatabase_Log_IO_percentage"
    time_aggregation_method      = "Average"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 90
    evaluation_frequency         = "PT5M"
    window_duration              = "PT5M"
    severity                     = 3
    description                  = "Log IO percentage. Not applicable to data warehouses."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  LogicApp_Action_Latency_21 = {

    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "ActionLatency" and ResourceId contains "MICROSOFT.LOGIC/WORKFLOWS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
QUERY
    name                         = "LogicApp_Action_Latency"
    time_aggregation_method      = "Average"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 5
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    severity                     = 3
    description                  = "Latency of completed workflow actions."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  LogicApp_Actions_Skipped_22 = {

    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(1h)
| where MetricName == "ActionsSkipped" and ResourceId contains "MICROSOFT.LOGIC/WORKFLOWS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 1h)
QUERY
    name                         = "LogicApp_Actions_Skipped"
    time_aggregation_method      = "Average"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 10
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    severity                     = 3
    description                  = "Number of workflow actions skipped."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  LogicApp_Run_Failure_Percentage_23 = {

    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == "RunFailurePercentage" and ResourceId contains "MICROSOFT.LOGIC/WORKFLOWS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 5m)
QUERY
    name                         = "LogicApp_Run_Failure_Percentage"
    time_aggregation_method      = "Average"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 80
    evaluation_frequency         = "PT1M"
    window_duration              = "PT5M"
    severity                     = 1
    description                  = "Percentage of workflow runs failed."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }
  LogicApp_Run_Latency_24 = {

    query                        = <<-QUERY
  AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "RunLatency" and ResourceId contains "MICROSOFT.LOGIC/WORKFLOWS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
QUERY
    name                         = "LogicApp_Run_Latency"
    time_aggregation_method      = "Average"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 5
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    severity                     = 3
    description                  = "Latency of completed workflow runs."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }
  LogicApp_Runs_Failed_25 = {

    query                        = <<-QUERY
  AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "RunsFailed" and ResourceId contains "MICROSOFT.LOGIC/WORKFLOWS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    name                         = "LogicApp_Runs_Failed"
    time_aggregation_method      = "Average"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 10
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    severity                     = 3
    description                  = "Number of workflow runs failed."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }
  LogicApp_Trigger_Latency_26 = {
    query                        = <<-QUERY
  AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "TriggerLatency" and ResourceId contains "MICROSOFT.LOGIC/WORKFLOWS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
   QUERY
    name                         = "LogicApp_Trigger_Latency"
    time_aggregation_method      = "Average"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 5
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    severity                     = 3
    description                  = "Latency of completed workflow triggers."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  LogicApp_Triggers_Failed_27 = {

    query                        = <<-QUERY
  AzureMetrics
| where TimeGenerated >= ago(1h)
| where MetricName == "TriggersFailed" and ResourceId contains "MICROSOFT.LOGIC/WORKFLOWS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 1h)
    QUERY
    name                         = "LogicApp_Triggers_Failed"
    time_aggregation_method      = "Average"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 10
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    severity                     = 3
    description                  = "Number of workflow triggers failed."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  LogicApp_Actions_Failed_28 = {

    query                        = <<-QUERY
  AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "ActionsFailed" and ResourceId contains "MICROSOFT.LOGIC/WORKFLOWS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
     QUERY
    name                         = "LogicApp_Actions_Failed"
    time_aggregation_method      = "Average"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 10
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    severity                     = 3
    description                  = "Number of workflow actions failed."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  APIManagement_Duration_of_Backend_Requests_29 = {

    query                        = <<-QUERY
  AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "BackendDuration" and ResourceId contains "MICROSOFT.APIMANAGEMENT/SERVICE"
| summarize Result = avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
      QUERY
    name                         = "APIManagement_Duration_of_Backend_Requests"
    time_aggregation_method      = "Average"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 5000
    evaluation_frequency         = "PT1M"
    window_duration              = "PT5M"
    severity                     = 3
    description                  = "Duration of Backend Requests in milliseconds."
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  APIManagement_capacity_29 = {
    name                         = "APIManagement_capacity_alert"
    operator                     = "GreaterThan"
    threshold                    = 90
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "Capacity" and ResourceId contains "MICROSOFT.APIMANAGEMENT/SERVICE"
| summarize Result = avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 1
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Alert for Utilization metric for ApiManagement service"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  APIManagement_duration_30 = {
    name                         = "APIManagement_duration_alert"
    operator                     = "GreaterThan"
    threshold                    = 1500
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
//| where TimeGenerated >= ago(3m)
| where MetricName == "Duration" and ResourceId contains "MICROSOFT.APIMANAGEMENT/SERVICE"
| summarize Result = avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 3m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT5M"
    window_duration              = "PT5M"
    description                  = "Alert for Overall Duration of Gateway Requests in milliseconds"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  APIManagement_EventHubDroppedEvents_31 = {
    name                         = "APIManagement_EventHubDroppedEvents_alert"
    operator                     = "GreaterThan"
    threshold                    = 50
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(1h)
| where MetricName == "EventHubDroppedEvents" and ResourceId contains "MICROSOFT.APIMANAGEMENT/SERVICE"
| summarize Result = sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 1h)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    description                  = "Alert for Number of events skipped because of queue size limit reached"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  APIManagement_EventHubRejectedEvents_32 = {
    name                         = "APIManagement_EventHubRejectedEvents_alert"
    operator                     = "GreaterThan"
    threshold                    = 50
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(1h)
| where MetricName == "EventHubRejectedEvents" and ResourceId contains "MICROSOFT.APIMANAGEMENT/SERVICE"
| summarize Result = sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 1h)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    description                  = "Alert for Number of rejected EventHub events (wrong configuration or unauthorized)"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  APIManagement_EventHubTimedoutEvents_33 = {
    name                         = "APIManagement_EventHubTimedoutEvents_alert"
    operator                     = "GreaterThan"
    threshold                    = 50
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(1h)
| where MetricName == "EventHubTimedoutEvents" and ResourceId contains "MICROSOFT.APIMANAGEMENT/SERVICE"
| summarize Result = sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 1h)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    description                  = "Alert for Number of timed out EventHub events"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  APIManagement_EventHubTotalFailedEvents_34 = {
    name                         = "APIManagement_EventHubTotalFailedEvents_alert"
    operator                     = "GreaterThan"
    threshold                    = 50
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(1h)
| where MetricName == "EventHubTotalFailedEvents" and ResourceId contains "MICROSOFT.APIMANAGEMENT/SERVICE"
| summarize Result = sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 1h)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    description                  = "Alert for Number of failed EventHub events"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  APIManagement_CpuPercent_Gateway_35 = {
    name                         = "APIManagement_CpuPercent_Gateway_alert"
    operator                     = "GreaterThan"
    threshold                    = 90
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "CpuPercent_Gateway" and ResourceId contains "MICROSOFT.APIMANAGEMENT/SERVICE"
| summarize Result = avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Alert for CPU Percentage of Gateway for SKUv2 services"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  APIManagement_MemoryPercent_Gateway_36 = {
    name                         = "APIManagement_MemoryPercent_Gateway_alert"
    operator                     = "GreaterThan"
    threshold                    = 90
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "MemoryPercent_Gateway" and ResourceId contains "MICROSOFT.APIMANAGEMENT/SERVICE"
| summarize Result = avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Alert for Memory Percentage of Gateway for SKUv2 services"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  ApplicationGateway_BlockedCount_37 = {
    name                         = "ApplicationGateway_BlockedCount_alert"
    operator                     = "GreaterThan"
    threshold                    = 10
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(1m)
| where MetricName == "BlockedCount" and ResourceId contains "MICROSOFT.NETWORK/APPLICATIONGATEWAYS"
| summarize Result = sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 1m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT1M"
    window_duration              = "PT1M"
    description                  = "Alert for Web Application Firewall blocked requests rule distribution"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  ApplicationGateway_BlockedReqCount_38 = {
    name                         = "ApplicationGateway_BlockedReqCount_alert"
    operator                     = "GreaterThan"
    threshold                    = 10
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == "BlockedReqCount" and ResourceId contains "MICROSOFT.NETWORK/APPLICATIONGATEWAYS"
| summarize Result = sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Alert for Web Application Firewall blocked requests count"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  ApplicationGateway_CurrentConnections_39 = {
    name                         = "ApplicationGateway_CurrentConnections_alert"
    operator                     = "GreaterThan"
    threshold                    = 2500
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == "CurrentConnections" and ResourceId contains "MICROSOFT.NETWORK/APPLICATIONGATEWAYS"
| summarize Result = sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT5M"
    window_duration              = "PT5M"
    description                  = "Alert for Count of current connections established with Application Gateway"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  ApplicationGateway_FailedRequests_40 = {
    name                         = "ApplicationGateway_FailedRequests_alert"
    operator                     = "GreaterThan"
    threshold                    = 100
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(5m)
| where MetricName == "FailedRequests" and ResourceId contains "MICROSOFT.NETWORK/APPLICATIONGATEWAYS"
| summarize Result = sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT1M"
    window_duration              = "PT5M"
    description                  = "Alert for Count of failed requests that Application Gateway has served"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  ApplicationGateway_TotalRequests_41 = {
    name                         = "ApplicationGateway_TotalRequests_alert"
    operator                     = "GreaterThan"
    threshold                    = 15000
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(1m)
| where MetricName == "TotalRequests" and ResourceId contains "MICROSOFT.NETWORK/APPLICATIONGATEWAYS"
| summarize Result = sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 1m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT1M"
    window_duration              = "PT1M"
    description                  = "Alert for Count of successful requests that Application Gateway has served"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  ApplicationGateway_UnhealthyHostCount_42 = {
    name                         = "ApplicationGateway_UnhealthyHostCount_alert"
    operator                     = "GreaterThan"
    threshold                    = 1
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where TimeGenerated >= ago(15m)
| where MetricName == "UnhealthyHostCount" and ResourceId contains "MICROSOFT.NETWORK/APPLICATIONGATEWAYS"
| summarize Result = avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 1
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Alert for Number of unhealthy backend hosts"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  ServiceBusNamespace_AbandonMessage_43 = {
    name                         = "ServiceBusNamespace_AbandonMessage_alert"
    operator                     = "GreaterThan"
    threshold                    = 100
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == 'AbandonMessage' and ResourceId contains 'MICROSOFT.SERVICEBUS/NAMESPACES' 
| summarize Result=sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT5M"
    window_duration              = "PT5M"
    description                  = "Alert for Abandoned Messages"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  ServiceBusNamespace_ServerSendLatency_44 = {
    name                         = "ServiceBusNamespace_ServerSendLatency_alert"
    operator                     = "GreaterThan"
    threshold                    = 1500
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "ServerSendLatency" and ResourceId contains "MICROSOFT.SERVICEBUS/NAMESPACE"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT5M"
    window_duration              = "PT5M"
    description                  = "Alert for Server Send Latency"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }


  ApplicationInsights_availability_45 = {
    name                         = "Availability"
    operator                     = "LessThan"
    threshold                    = 80
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "Availability" and ResourceId contains "MICROSOFT.INSIGHTS/COMPONENTS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 5m)
  QUERY
    severity                     = 0
    evaluation_frequency         = "PT5M"
    window_duration              = "PT5M"
    description                  = "Percentage of successfully completed availability tests"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  DataFactoryV2_ActivityFailedRuns_46 = {
    name                         = "Failed activity runs metrics"
    operator                     = "GreaterThanOrEqual"
    threshold                    = 10
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "ActivityFailedRuns" and ResourceId contains "MICROSOFT.DATAFACTORY/FACTORIES"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 1h)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    description                  = "ActivityType, PipelineName, FailureType, Name"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  DataFactoryV2_IntegrationRuntimeCpuPercentage_47 = {
    name                         = "Integration runtime CPU utilization"
    operator                     = "GreaterThan"
    threshold                    = 90
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "IntegrationRuntimeCpuPercentage" and ResourceId contains "MICROSOFT.DATAFACTORY/FACTORIES"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT5M"
    window_duration              = "PT15M"
    description                  = "Integration runtime CPU utilization"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  DataFactoryV2_SSISIntegrationRuntimeStartFailed_48 = {
    name                         = "Failed SSIS integration runtime start metrics"
    operator                     = "GreaterThan"
    threshold                    = 3
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "SSISIntegrationRuntimeStartFailed" and ResourceId contains "MICROSOFT.DATAFACTORY/FACTORIES"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 1h)
  QUERY
    severity                     = 3
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    description                  = "Failed SSIS integration runtime start metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  DataFactoryV2_SSISIntegrationRuntimeStopStuck_49 = {
    name                         = "Stuck SSIS integration runtime stop metrics"
    operator                     = "GreaterThan"
    threshold                    = 3
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "SSISIntegrationRuntimeStopStuck" and ResourceId contains "MICROSOFT.DATAFACTORY/FACTORIES"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 1h)
  QUERY
    severity                     = 0
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    description                  = "Stuck SSIS integration runtime stop metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  DataFactoryV2_SSISPackageExecutionFailed_50 = {
    name                         = "DataFactoryV2_SSISPackageExecutionFailed_alert"
    operator                     = "GreaterThan"
    threshold                    = 3
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "SSISPackageExecutionFailed" and ResourceId contains "MICROSOFT.DATAFACTORY/FACTORIES"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 1h)
  QUERY
    severity                     = 0
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    description                  = "Alert for failed SSIS package execution metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  DataFactoryV2_TriggerFailedRuns_51 = {
    name                         = "DataFactoryV2_TriggerFailedRuns_alert"
    operator                     = "GreaterThan"
    threshold                    = 3
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "TriggerFailedRuns" and ResourceId contains "MICROSOFT.DATAFACTORY/FACTORIES"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 1h)
  QUERY
    severity                     = 0
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    description                  = "Alert for failed trigger runs metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  DataFactoryV2_PipelineFailedRuns_52 = {
    name                         = "DataFactoryV2_PipelineFailedRuns_alert"
    operator                     = "GreaterThan"
    threshold                    = 3
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "PipelineFailedRuns" and ResourceId contains "MICROSOFT.DATAFACTORY/FACTORIES"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 1h)
  QUERY
    severity                     = 0
    evaluation_frequency         = "PT1H"
    window_duration              = "PT1H"
    description                  = "Alert for Failed pipeline runs metrics"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  Key_Vault_Availability_53 = {
    name                         = "Key_Vault_Availability_alert"
    operator                     = "LessThan"
    threshold                    = 0.98
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "Availability" and ResourceId contains "MICROSOFT.KEYVAULT/VAULTS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT10M"
    window_duration              = "PT15M"
    description                  = "Alert for Vault requests availability"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  Storage_Account_Availability_54 = {
    name                         = "Storage_Account_Availability_alert"
    operator                     = "LessThan"
    threshold                    = 98
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "Availability" and ResourceId contains "MICROSOFT.STORAGE/STORAGEACCOUNTS"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 15m)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT10M"
    window_duration              = "PT15M"
    description                  = "Alert for the percentage of availability for the storage service or the specified API operation"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  LogicAppStd_WorkflowRunsFailureRate_55 = {
    name                         = "LogicAppStd_WorkflowRunsFailureRate_alert"
    operator                     = "GreaterThan"
    threshold                    = 90
    time_aggregation_method      = "Total"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "WorkflowRunsFailureRate" and ResourceId contains "MICROSOFT.WEB/SITES"
| summarize Result= sum(Total) by Resource, _ResourceId, bin(TimeGenerated, 1d)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT1H"
    window_duration              = "P1D"
    description                  = "Alert for Workflow Runs Failure Rate For LogicApps only"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }

  Container_Registry_StorageUsed_56 = {
    name                         = "Container_Registry_StorageUsed_alert"
    operator                     = "GreaterThan"
    threshold                    = 36
    time_aggregation_method      = "Average"
    query                        = <<-QUERY
AzureMetrics
| where MetricName == "StorageUsed" and ResourceId contains "MICROSOFT.CONTAINERREGISTRY/REGISTRIES"
| summarize Result= avg(Average) by Resource, _ResourceId, bin(TimeGenerated, 1h)
  QUERY
    severity                     = 2
    evaluation_frequency         = "PT30M"
    window_duration              = "PT1H"
    description                  = "Alert for the amount of storage used by the container registry"
    enabled                      = true
    minimum_failing_periods      = 1
    number_of_evaluation_periods = 1
  }
}