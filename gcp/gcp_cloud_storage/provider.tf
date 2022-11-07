terraform {
  required_version = ">= 1.0"
}

provider "google" {
  credentials = file("../azure-svc-cred.json")
  project     = "<ProjectID>"
  region      = "us-east4"
  zone        = "us-east4-a"
}