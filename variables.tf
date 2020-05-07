variable "queue_arn" {
  description = "ARN of target SQS queue"
  default = ""
}
variable "queue_url" {
  description = "Queue URL"
}
variable "policy" {
  description = "IAM Policy to use"
  default = null
}
variable "arn" {
  type    = string
  default = ""
}
variable "arns" {
  type    = list(string)
  default = []
}
variable "actions" {
  type    = list(string)
  default = ["SQS:SendMessage"]
}
variable "create" {
  type    = bool
  default = true
}
