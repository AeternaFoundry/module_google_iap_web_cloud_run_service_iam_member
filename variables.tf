variable "iap_web_cloud_run_service_iam_members" {
  description = <<EOT
Map of iap_web_cloud_run_service_iam_members, attributes below
Required:
    - cloud_run_service_name
    - member
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    cloud_run_service_name = string
    member                 = string
    role                   = string
    location               = optional(string)
    project                = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

