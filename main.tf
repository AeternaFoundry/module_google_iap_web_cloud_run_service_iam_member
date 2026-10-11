resource "google_iap_web_cloud_run_service_iam_member" "iap_web_cloud_run_service_iam_members" {
  for_each = var.iap_web_cloud_run_service_iam_members

  cloud_run_service_name = each.value.cloud_run_service_name
  member                 = each.value.member
  role                   = each.value.role
  location               = each.value.location
  project                = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

