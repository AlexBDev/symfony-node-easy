# symfony-node-easy

Simple Dockerfile to run PHP 7.3 Node NPM for quick prototyping

### Build

```bash
$ docker build -t symfony-node-easy .
```

### Run Symfony serve

``bash
$ docker run -it -p 8000:8000 -v ${PWD}:/app symfony-bin-installer serve
```

### Get in bash

```bash
$ docker run -it --entrypoint bash -v ${PWD}:/app symfony-node-easy
`
`
