## GSMC-Public ##

![GSMC Logo](https://bitbucket.org/gsmcenter/public/avatar/128)

`docker`, `services`, `manager`, `gsmc`, `gsm-center`

--------

### What is GSMC-Public ###

***GSMC-Public*** is a web engine based on [Laravel](http://laravel.com) Framework


### Dependencies ###

Component | Tag | Version
----------|---------|----
laravel | framework | 5.2
gsmc | public | 0.0.1


### Container actions ###

##### PULL
```
source .env;
docker pull tbaltrushaitis/gsmc-public
```

##### BUILD:
```
docker build -c 512 --cpuset-cpus=0-1 -m 1024 --no-cache --pull --rm -f Docker.files/mongo/Dockerfile -t tbaltrushaitis/gsmc-public:latest .
```

##### COMMIT:
```
docker commit 5db0dcd0d497
```

##### PUSH:
```
docker push tbaltrushaitis/gsmc-public:0.0.2
```

* Configuration
* Data storage configuration
* How to run tests
* Deployment instructions
* Scaling instructions

### Maintainers ###

* [Baltrushaitis Tomas](https://bitbucket.org/tbaltrushaitis)
* I'm ready to get help in creation of tomorrow web ... its you just come as a contributor?

### Production Site ###
:star2: [Global Solutions Management Center](http://gsm-center.com.ua)

### Bonus ###
* [Learn Bitbucket Markdown](https://bitbucket.org/tutorials/markdowndemo)

# **G**lobal **S**olutions **M**anagement **C**enter #
