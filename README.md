# vue3-primevue-tailwindcss

## Project Launch

### Docker
Project development is possible in the Docker environment (the application is launched in a container)

The supported operating systems are MacOS, Linux, or Windows (WSL2).
(When using Windows, place the project repository in the WSL file system, also ensure your system and git are using the LF line feed format and not replacing it with CRLF).

Docker and Docker-compose must be installed on your computer.

To start the containers, use the following command:

```sh
docker compose up
```
Enter to CLI container:
```sh
docker exec -it vue3-primevue-tailwindcss sh
```

## Project Setup

```sh
yarn install
```

### Compile and Hot-Reload for Development

```sh
yarn dev
```

### Type-Check, Compile and Minify for Production

```sh
yarn build
```

### Lint with [ESLint](https://eslint.org/)

```sh
yarn lint
```
