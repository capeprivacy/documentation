# Support matrix

This document provides information about supported operating systems, language versions and other dependencies.

## Operating systems

We expect Cape Privacy services and libraries to work on:

* Linux (all distros)
* macOS (10.15 - Catalina and above)
* Windows 10

We test against the following operating systems:

* Ubuntu 18.04

## Container and database versions

We expect Cape Coordinator to work with the following:

* Kubernetes 1.16+
* Helm installation 3.0+
* PostgreSQL 11.0+

We test against the following:

* Kubernetes 1.18
* Helm 3.2
* PostgreSQL 11.7


## Python environments

Cape Python supports Python 3.6, 3.7, and 3.8.

We expect Cape Python to work with most versions of Spark (v2.4.5+) and Pandas (v1.0.0+). 

We test on:

* Pandas v1.0.3
* Spark v3.0.0

!!! note
    We recommend using Spark 3.0 or above. Cape Python has an optional dependency on PyArrow, which works with Spark 3.0, but requires additional configuration on Spark 2.x.
