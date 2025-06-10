variable "namespace" {
  description = "Name for the PaaS Log V2 Alert"
  type        = string
}
variable "resource_group_name" {
   description = "Resource group for the PaaS Log V2 Alert"
  type        = string
}
variable "location" {
  description = "Location for the PaaS Log V2 Alert"
  type        = string
}
variable "scopes" {
    description = "List of resource IDs to scope the alert rule to"
    type        = list(string)
}

variable "name" {
  description = "Name of the alert rule"
  type        = string
}

variable "operator" {
  description = "Operator for the alert rule criteria (e.g. GreaterThan, LessThan)"
  type        = string
}

variable "threshold" {
  description = "Threshold value for the alert rule criteria"
  type        = number
}

variable "time_aggregation_method" {
  description = "Time aggregation method for the alert rule criteria (e.g. Total, Average)"
  type        = string
}

variable "metric_measure_column" {
  description = "Metric measure column for the alert rule criteria"
  type        = string
}

variable "resource_id_column" {
  description = "Resource ID column for the alert rule criteria"
  type        = string
}

variable "query" {
  description = "Kusto query for the alert rule criteria"
  type        = string
}

variable "severity" {
  description = "Severity of the alert rule (0 is highest, 4 is lowest)"
  type        = number
}

variable "evaluation_frequency" {
  description = "How often the alert rule is evaluated (e.g. PT5M)"
  type        = string
}

variable "window_duration" {
  description = "The time window over which data is analyzed (e.g. PT5M)"
  type        = string
}

variable "action_group_id" {
  description = "List of Action Group resource IDs to trigger when the alert fires"
  type        = list(string)
}
variable "description" {
  description = "Description of the alert rule"
  type        = string
}
variable "minimum_failing_periods" {
  description = "Minimum number of failing periods to trigger the alert"
  type        = number
  default     = 1
}
variable "number_of_evaluation_periods" {
  description = "Number of evaluation periods to consider for the alert"
  type        = number
  default     = 1  
}
variable "enabled" {
  description = "Whether the alert rule is enabled"
  type        = bool
  default     = true
}