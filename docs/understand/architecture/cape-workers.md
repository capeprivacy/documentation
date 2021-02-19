# Cape Workers

Cape workers are Docker images that can be built and run in the environment of your choice.

## Prerequisites
[Docker](https://docs.docker.com/)
A Cape Cloud Account
A Cape Cloud [organization token](/understand/features/tokens)
An S3 bucket for retrieving data

### Supported SHA Commits
`bcc4e3b`

## Starting your `cape-worker` instance

Starting your Cape worker is as simple as running a Docker image using `docker run`:
```shell
  export CAPE_TOKEN=my-cape-org-token
  docker run -d --rm                     \
    --name cape-worker                   \
    -e CAPE_TOKEN                        \
    -e CAPE_BUCKET=my-s3-bucket-location \
    capeprivacy/cape-worker:sha-1234567
```

In this command:
- `cape-worker` is the name you want to assign your container.
- `my-cape-org-token` is your [Cape organization token](/understand/features/tokens).
- `s3-bucket-location` is the URI of the S3 bucket that you would like Cape to write the results of the computation to.
- `sha-1234567` is the commit SHA specifying the commit you would like to use to run your worker.

!!!TODO
  Provide CloudFormation Template