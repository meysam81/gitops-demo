output "aws_access_key_id" {
  value = aws_iam_access_key.this.id
}

output "aws_secret_access_key" {
  value     = aws_iam_access_key.this.secret
  sensitive = true
}

output "aws_region" {
  value = data.aws_region.this.name
}

output "aws_role_arn" {
  value = aws_iam_role.this.arn
}

output "kubernetes_secret_name" {
  value = kubernetes_secret.this.metadata[0].name
}
