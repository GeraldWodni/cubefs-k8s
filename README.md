# cubefs-k8s
[cubefs-cluster](https://www.cubefs.io/docs/master/quickstart/cluster-deploy.html) kubernetes deployment without helm, kept simple

## Motivation
There is a [helm deployment](https://github.com/cubefs/cubefs-helm) for cubefs. Unfortunately it seems to be abandoned, and I am not smart enough to understand all that code.

This is a simple repository which creates docker files for sooper easy deployment in kubernetes.


## Configuration
### Master
[Official documentation](https://www.cubefs.io/docs/master/ops/configs/master.html#configuration-description)

### Meta Node
[Official documentation](https://www.cubefs.io/docs/master/ops/configs/metanode.html)

### Data Node
[Official documentation](https://www.cubefs.io/docs/master/ops/configs/datanode.html)
