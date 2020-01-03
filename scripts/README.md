# Generation

We use OpenAPI Generator to automatically generate our SDKs. This process is mostly automated using a few scripts outlined here.

## Installing the generator

Use `install-openapi-generator.sh` to download the version of generator that we use.

```
sh ./install-openapi-generator.sh
```

## Generating the SDKs

The SDKs are generated from the API definition files found in the [`/aylien/v1/`](/aylien/v1) directory. There are also JSON configuration files in these directories for each language (see [`/aylien/v1/news/config`](/aylien/v1/news/config) for example). This process is automatic using the `generate-sdks.sh` script.

```
sh ./generate-sdks.sh
```

Please note that this script calls `install-openapi-generator.sh` if it can't find the `openapi-generator-cli.jar` file.

## Post-generation

Unfortunately the generator has some limitations, and these limitations make it necessary for us to do some post-processing of the SDKs in order to make them fit for daily use of our users. There is a script for automatically applying these changes:

```
sh ./post-generation-modification.sh
```

## Publishing

```
sh ./publish.sh 'Release Note here'
```

## Testing

See the `samples` directory for instructions on testing.
