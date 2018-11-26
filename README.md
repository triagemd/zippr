# Zippr

This is a small service that allows fetching individual files from
large ZIP archives, using
[partial-zip](https://github.com/planetbeing/partial-zip) utility.

## Limitations

partial-zip utility works only with servers supporting `Content-Range`
header.

## Usage

You can launch the service using: `docker-compose up --build`, the `/`
endpoint requires two parameters: `url` and `filename`. Example usage:
`http://localhost:3000/?url=https://lab.triage.com/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBNExKTEE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ\=\=--7fe6358d1b26ccebfe5de75b5d17926a110206b3/archive.zip&filename=manifest.json`.
