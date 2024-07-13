---
sidebar_position: 50
---

# SOPS

``` bash
> sops -d secrets.enc.yaml > secrets.dec.yaml > echo secret_from_data | base64 -d
or similar:
> sops -d secrets.enc.yaml | yq '.data.validator_api_token' | base64 -d
```

encrypt the new secret (data section) in new_secrets.dec.yaml

``` bash
> echo -n 0xe9776766d7c4151b74e60d75b1e0114e22367cd9a456dd73b76f044a7b708c0c | base64
> kubectl apply -f new_secrets.dec.yaml
> sops -i -e new_secrets.dec.yaml
```
