### Generics

variable "helm_release_atomic" {
  type        = bool
  default     = true
  description = "Whether to install the chart in a single transaction"
}

variable "helm_cleanup_on_fail" {
  type        = bool
  default     = true
  description = "Whether to delete the release if it failed"
}

variable "helm_create_namespace" {
  type        = bool
  default     = false
  description = "Whether to create the namespace if it does not exist"
}

variable "helm_dependency_update" {
  type        = bool
  default     = true
  description = "Whether to update dependencies before installing the chart"
}

variable "helm_max_history" {
  type        = number
  default     = 20
  description = "The maximum number of revisions to keep"
}

variable "helm_lint" {
  type        = bool
  default     = true
  description = "Whether to run helm lint before installing the chart"
}

variable "helm_reset_values" {
  type        = bool
  default     = false
  description = "Whether to reset the values to the ones built into the chart"
}

variable "helm_reuse_values" {
  type        = bool
  default     = true
  description = "Whether to reuse the last release's values and merge in any overrides"
}

variable "helm_timeout" {
  type        = number
  default     = 600
  description = "Time in seconds to wait for any individual Kubernetes operation (like Jobs for hooks)"
}

variable "helm_wait" {
  type        = bool
  default     = true
  description = "Whether to wait until all Pods, PVCs, Services, and minimum number of Pods of a Deployment are in a ready state before marking the release as successful"
}

variable "helm_wait_for_jobs" {
  type        = bool
  default     = true
  description = "Whether to wait until all Jobs have been completed before marking the release as successful"
}

### Release

variable "release_name" {
  type        = string
  description = "The name of the helm release (e.g. argo-cd)"
}

variable "repository" {
  type        = string
  description = "The helm repository (e.g. https://argoproj.github.io/argo-helm)"
}

variable "chart_name" {
  type        = string
  description = "The name of the helm chart (e.g. argo-cd)"
}

variable "release_namespace" {
  type        = string
  description = "The namespace of the helm release (e.g. gitops)"
}

variable "release_version" {
  type        = string
  description = "The release version of Helm Chart (e.g. 5.46.x)"
}

variable "values" {
  type        = list(string)
  description = "The list of values files for Helm Chart. Not sensitive, only to declutter the output."
  default     = []
  sensitive   = true
}

variable "set" {
  type = list(object({
    name  = string
    value = string
    type  = string
  }))
  description = "The list of Helm values to set"
  default     = []
}

variable "set_from_ssm" {
  type = list(object({
    name        = string
    target_name = string
    type        = string
  }))
  description = "The list of SSM parameters to set as Helm values"
  default     = []
}

variable "set_sensitive_from_ssm" {
  type = list(object({
    name        = string
    target_name = string
    type        = string
  }))
  description = "The list of SSM parameters to set in sensitive mode as Helm values"
  default     = []
}

variable "devel" {
  type        = bool
  default     = false
  description = "Whether to use development versions, too. Equivalent to version '>0.0.0-0'. If version is set, this is ignored."
}
