output "manifests" {
  value       = helm_release.this.manifest
  description = "The rendered manifests for this release"
  sensitive   = true
}

output "metadata" {
  value       = helm_release.this.metadata
  description = "The metadata for this release"
  sensitive   = true
}

output "status" {
  value       = helm_release.this.status
  description = "The status of this release"
}

output "app_version" {
  value       = helm_release.this.metadata[0].app_version
  description = "The app version of this release"
}

output "chart" {
  value       = helm_release.this.metadata[0].chart
  description = "The chart of this release"
}

output "name" {
  value       = helm_release.this.metadata[0].name
  description = "The name of this release"
}

output "namespace" {
  value       = helm_release.this.metadata[0].namespace
  description = "The namespace of this release"
}

output "revision" {
  value       = helm_release.this.metadata[0].revision
  description = "The revision of this release"
}

output "values" {
  value       = helm_release.this.metadata[0].values
  description = "The values of this release"
  sensitive   = true
}
