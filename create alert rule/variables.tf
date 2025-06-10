variable "rg_name" {
  type        = string
  description = "resource group name"
}
variable "scope_id" {
  type        = list(string)
  description = "Log Analytics workspaces id"
}
variable "action_id" {
  type        = list(string)
  description = "Action group id"
}

variable "alerts" {
  type = map(object({
    name                         = string
    operator                     = string
    threshold                    = number
    time_aggregation_method      = string
    query                        = string
    severity                     = number
    evaluation_frequency         = string
    window_duration              = string
    description                  = string
    enabled                      = bool
    minimum_failing_periods      = number
    number_of_evaluation_periods = number
  }))
  description = "Configuration for the PaaS Log V2 Alert"
}

