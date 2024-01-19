# About CustomCloud

This is what I use as a base to build my own server with my preferred configuration, but it is made as a reusable template. You can consider it a basic template to build small Nextcloud servers with small customizations.

## Licensing terms

The code on this repo is public under the terms of the MIT license. Feel free to use it on any public or private work.

## Basic usage

Create a .env file in the root folder with the passwords to be used during the provisioning.
Use example.env as an example. Then, docker-compose up --build to run the server.

```
$ cp example.env .env
$ docker-compose up 
```

To release resources:

```
$ docker-compose down
```

