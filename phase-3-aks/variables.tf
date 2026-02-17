variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

variable "db_password" {
  description = "The password for the Postgres DB"
  type        = string
  sensitive   = true 
}