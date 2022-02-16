### Digital Ocean with terrafrom

```
ssh-keygen -t ed25519 -f digitalocean
```

#### connect to remote vm with custom key, with Digital Ocean being custom key with user root
```
ssh root@<public_ip> -i digitalocean
```

##### Connect with Mosh (after ssh configuration chnages)

```
mosh <username>@<public_ip> --ssh="ssh -p <port> -i <custom_key>"

# example

mosh linuxuser@12.34.56.78 --ssh="ssh -p 1234 -i myprivatesshkey"
```

## Still needs some tuning up....

## references

##### regular terrform commands
```
terraform console
terraform fmt
terraform init
terraform init -reconfigure
terraform plan 

# formats plan to no color removes funny characters
terraform plan -no-color > tfplan.txt

terraform validate
terraform apply -auto-approve
terraform destroy -auto-approve

# output to formated json (jq needs to be installed) run after apply
terraform show -json | jq . > state.json

# target a specific terraform resource
terraform plan -target resource.name 
terraform apply -auto-approve

# show public ip with az cli and format to json
az network public-ip list | jq . > ip-addresses.json

```


