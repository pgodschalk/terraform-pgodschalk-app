module "your_app" {
  source = "github.com/pgodschalk/tfmod-app"

  dns_record = {
    "your-app" = {
      domain  = "example.org"
      name    = "your-app"
      content = toset(["127.0.0.1"])
      type    = A
    }
  }
}
