resource "kubernetes_manifest" "css" {
  manifest = {
    apiVersion = "external-secrets.io/v1beta1"
    kind       = "ClusterSecretStore"

    metadata = {
      name = "aws-parameter-store"
    }

    spec = {
      provider = {
        aws = {
          service = "ParameterStore"
          region  = var.aws_region

          auth = {
            secretRef = {
              accessKeyIDSecretRef = {
                name      = var.kubernetes_secret_name
                namespace = var.kubernetes_namespace
                key       = "AWS_ACCESS_KEY_ID"
              }
              secretAccessKeySecretRef = {
                name      = var.kubernetes_secret_name
                namespace = var.kubernetes_namespace
                key       = "AWS_SECRET_ACCESS_KEY"
              }
            }
          }

          role = var.aws_role_arn
        }
      }
    }
  }
}
