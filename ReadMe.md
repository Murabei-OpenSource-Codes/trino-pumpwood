# Trino Pumpwood
This repository creates images to facilitate deploy of trino on docker-compose
and K8s cluster. It is based on official
<a href="https://hub.docker.com/r/trinodb/trino"> Trino docker image </a>
with few modifications to facilitate deploy on simple environments.

<p align="center" width="60%">
  <img src="doc/sitelogo-horizontal.png" /> <br>

  <a href="https://en.wikipedia.org/wiki/Cecropia">
    Pumpwood is a native brasilian tree
  </a> which has a symbiotic relation with ants (Murabei)
</p>


<a href="https://trino.io/">
  Trino website
</a>

## User ownership adjust
Extenal volumes on docker-compose and K8s are monted with root ownership,
entrypoint script was modified to ajust ownership to trino user of
`/etc/trino`.

## Catalog as zip file
Data catalog can be passed as a zip file to container at `/catalog/catalog.zip`
entrypoint script will unzip file at `/etc/trino/`. It is expected to catalog
is a catalog zipped folder.

This feature makes it easier to deploy Trino on a K8s cluster, mounting a
single file as secret to container.

## SHARED_SECRET as Env variable
SHARED_SECRET between coordinator and worker can be passed as environment
variable facilitating deploy.

## Automatically create node.id for worker node
Create a UUID for each worker node at container startup.

## WARNING: Do not expose Trino outside of cluster!
It was not configured secrets for authentication so it is possible to query
and logging without any authentication. Trino is deployed on a cluster should
not be exposed to outside of the cluster.
