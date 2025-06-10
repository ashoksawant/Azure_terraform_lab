data "azurerm_resource_group" "rgname" {
  name = var.rg_name
}

module "alerts" {
  for_each = var.alerts

  source                = "./paaslogv2alert"
  resource_group_name   = data.azurerm_resource_group.rgname.name
  location              = data.azurerm_resource_group.rgname.location
  metric_measure_column = "Result"
  resource_id_column    = "_ResourceId"
  scopes                = var.scope_id
  namespace             = "Microsoft.OperationalInsights/workspaces"
  action_group_id       = var.action_id



  query                   = each.value.query
  name                    = each.value.name
  time_aggregation_method = each.value.time_aggregation_method
  operator                = each.value.operator
  threshold               = each.value.threshold
  evaluation_frequency    = each.value.evaluation_frequency
  window_duration         = each.value.window_duration
  severity                = each.value.severity
  description             = each.value.description
}
