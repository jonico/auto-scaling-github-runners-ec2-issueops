module "lambdas" {
  source = "philips-labs/github-runner/aws//modules/download-lambda"
  lambdas = [
    {
      name = "webhook"
      tag  = "v0.10.0"
    },
    {
      name = "runners"
      tag  = "v0.10.0"
    },
    {
      name = "runner-binaries-syncer"
      tag  = "v0.10.0"
    }
  ]
}

output "files" {
  value = module.lambdas.files
}
