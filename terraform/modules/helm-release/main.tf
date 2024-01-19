data "kubernetes_namespace" "this" {
  count = var.helm_create_namespace ? 0 : 1

  metadata {
    name = var.release_namespace
  }
}

resource "helm_release" "this" {
  name       = var.release_name
  repository = var.repository
  chart      = var.chart_name
  version    = var.release_version
  namespace  = try(data.kubernetes_namespace.this[0].metadata[0].name, var.release_namespace)

  devel = var.devel

  values = var.values

  dynamic "set" {
    for_each = var.set_from_ssm

    content {
      name  = var.set_from_ssm[set.key].target_name
      value = data.aws_ssm_parameter.set[set.key].value
      type  = coalesce(var.set_from_ssm[set.key].type, "string")
    }
  }

  dynamic "set" {
    for_each = var.set

    content {
      name  = set.value.name
      value = set.value.value
      type  = coalesce(set.value.type, "string")
    }
  }

  dynamic "set_sensitive" {
    for_each = var.set_sensitive_from_ssm

    content {
      name  = var.set_sensitive_from_ssm[set_sensitive.key].target_name
      value = data.aws_ssm_parameter.set_sensitive[set_sensitive.key].value
      type  = coalesce(var.set_sensitive_from_ssm[set_sensitive.key].type, "string")
    }
  }

  atomic            = var.helm_release_atomic
  cleanup_on_fail   = var.helm_cleanup_on_fail
  create_namespace  = var.helm_create_namespace
  dependency_update = var.helm_dependency_update
  max_history       = var.helm_max_history
  lint              = var.helm_lint
  reset_values      = var.helm_reset_values
  reuse_values      = var.helm_reuse_values
  timeout           = var.helm_timeout
  wait              = var.helm_wait
  wait_for_jobs     = var.helm_wait_for_jobs
}

data "aws_ssm_parameter" "set" {
  count = length(var.set_from_ssm)
  name  = var.set_from_ssm[count.index].name
}

data "aws_ssm_parameter" "set_sensitive" {
  count = length(var.set_sensitive_from_ssm)
  name  = var.set_sensitive_from_ssm[count.index].name
}
