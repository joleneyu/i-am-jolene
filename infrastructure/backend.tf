terraform {
  backend "s3" {
    bucket = "baobeier-terraform-states"
    key    = "path/to/state"
    region = "ap-southeast-2"
  }
}
