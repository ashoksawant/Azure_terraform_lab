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