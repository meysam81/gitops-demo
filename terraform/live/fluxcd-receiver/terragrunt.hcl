include "root" {
  path = find_in_parent_folders()
}

include "k8s" {
  path = find_in_parent_folders("k8s.hcl")
}

terraform {
  source = "../../modules/github-push-event"
}

inputs = {
  repository = "gitops-demo"

  receiver_resources = [
    {
      kind      = "GitRepository"
      name      = "gitops-demo"
      namespace = "flux-system"
    }
  ]

  receiver_url = "https://llama-unified-insect.ngrok-free.app"
}
