# audiveris-docker

## How to use

Create `.env` file from template:

```sh
cp .env.sample .env
```

And fill in your user id and group id like this:

```plaintext:.env
UID=1000
GID=1000
```
Put your music score file in `input/`.

Then, build Docker container and run, like this:

```sh
docker compose build
docker compose up
```

Finally, you will be able to obtain transformed `.mxl` and `.xml` file from `output/` directory.