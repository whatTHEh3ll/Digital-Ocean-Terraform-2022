variable "do_token" {
  description = "DigitalOcean API token"
}
variable "public_key_path" {
  description = "path to ssh public key"
}
variable "droplet_image" {
  description = "Image identifier of the OS in DigitalOcean"
  default     = "ubuntu-20-04-x64"
}
variable "droplet_region" {
  description = "Droplet region identifier where the droplet will be created"
  default     = "sfo3"
}
variable "droplet_size" {
  description = "Droplet size identifier"
  default     = "s-1vcpu-1gb"
}