# Flink Development Suite

Fast and furious development of Apache Flink projects
---



In a current version a given development suite is developed and tested for MacOSX environment(it should also work under Linux, but no garantees).
It heavily sets on Docker, that's why you have to install [Docker Toolbox](https://docs.docker.com/engine/installation/mac/) on your local machine, namely: Docker, Docker-Machine and Docker-Compose, which are shipped by a Toolbox be default.

Also current version provides [Emacs](https://www.gnu.org/software/emacs/) as IDE, but it also possible to extend it with [Atom](https://atom.io/), [Vim](http://www.vim.org/) or even [Sublime](http://www.sublimetext.com/).

### How to

Get a suite repository

```
 git clone --depth=1 https://github.com/zavalit/flink-development-suite.git
```

and don't change a name of a repository folder locally, cause image names a build upon that, strictly speaking ```docker-compose``` do it that way.

and create a VM, where the whole development suite will take place

```
docker-machine create -d virtualbox --virtualbox-cpu-count 4 flink-project
```
From now on, you have a VM named **flink-project** and we will roll out our development environment there. For that purpose:

```
//go to repository
$ cd flink-development-suite

//let your docker client know about your VM
$ eval $(docker-machine env flink-project)

//build your development suite
$ docker-compose -f docker-compose-build.yml build
```

at the end you have to see something like this popped up.
[Emacs](image)


### What is in a development suite

Suite is build upon a bunch of images each of them is actually pretty customizable on its own. The default stack looks like this:

```
Emacs -> Training -> FlinkDev -> Flink -> Java8
```

with the following docker images:
```
REPOSITORY                       TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
flinkdevelopmentsuite_emacs      latest              b64125a7a98d        6 minutes ago       2.023 GB
flinkdevelopmentsuite_training   latest              2e197eda6d99        12 minutes ago      1.31 GB
flinkdevelopmentsuite_flinkdev   latest              aed747089767        14 minutes ago      1.097 GB
flinkdevelopmentsuite_flink      latest              849b87857442        16 minutes ago      958.7 MB
flinkdevelopmentsuite_java8      latest              e5a16248d26e        17 minutes ago      855.6 MB
ubuntu                           trusty              6cc0fc2a5ee3        2 weeks ago         187.9 MB
```


1. **Java8**
What it does say for itself, it ships a java8 installation and do it upon ubuntu 14.04
You actually have to be able to exchange it though java7 image, cause flink aims to run also on Java7. For that just replace java8 with your java7 image in *docker-compose-build.yml*

2. **Flink**
Also pretty obvious, it's a flink binary.

3. **FlinkDev**
Builds upon Flink and ships maven, sbt and new user *dev*, which is stored in ENV DEV_USER

4. **Training**
Installs Dataasrtisans training artefacts

5. **Emacs**
Enrolls Emacs IDE with preinstalled packages, that are necessary to work with scala code.
