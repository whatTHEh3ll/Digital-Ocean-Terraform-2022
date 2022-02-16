output "ip" {
  value = digitalocean_droplet.dev.ipv4_address
}

// Ansible inventory
resource "local_file" "inventory" {
  filename = "hosts.ini"
  content  = <<-EOF
    [DigitalOcean]
    ${digitalocean_droplet.dev.ipv4_address}

    [all:vars]
    ansible_python_interpreter=/usr/bin/python3
    EOF
}