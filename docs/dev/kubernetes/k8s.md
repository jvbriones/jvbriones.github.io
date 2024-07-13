---
sidebar_position: 10
---
# K8s

### Add clusters to _.kube/config_

``` bash
> az login
> az account set --subscription 731f260b-aaaa-46c3-88f7-3e00b0e53aaa
> az aks get-credentials --resource-group rg-name --name k8s-name
...
> aws sso login
> aws eks update-kubeconfig --region eu-north-1 --name staking-aws-development-argo
```

### Switch between contexts

``` bash
> kubectl config use-context my-cluster
> kubectl get ns
> kubectl config set-context --current --namespace=my-namespace
```

> or better by using the [kubeselect](https://github.com/fatliverfreddy/kubeselect) and [kubens](https://github.com/ahmetb/kubectx) tools

### Applying changes

``` bash
> kubectl apply -f kubernetes
> kubectl apply -f file.yml
```

### Top commands

COMMAND | DESCRIPTION
---|---
`kubectl get nodes -o wide` | Get info of all nodes
`kubectl -n my-namespace get svc` | Get services
`kubectl -n my-namespace get pods` | Get pods
`kubectl -n my-namespace describe pod stack-66c75978f9-szjz5` | Show info of pod
`kubectl -n my-namespace exec -it stack-66c75978f9-szjz5 -- sh` | Run console inside pod
`kubectl -n my-namespace delete deployment <dep_id>` | Kill a deployment
`kubectl -n kss-local delete service <serv_id>` | Kill a service
`stern -s 5m stack-66c75978f9-szjz5` | Show logs on local console
