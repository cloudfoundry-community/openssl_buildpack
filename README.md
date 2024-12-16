# Cloud Foundry OpenSSL Buildpack

A Cloud Foundry [buildpack](http://docs.cloudfoundry.org/buildpacks/) for using OpenSSL 1.1 on cflinuxfs4.

This supply buildpack is meant to be used with the .NET buildpack as the final buildpack. This buildpack sets the
the `LD_LIBRARY_PATH` and the `CLR_OPENSSL_VERSION_OVERRIDE` environment variables needed by .NET apps to be able
to use the non-default OpenSSL version. This buildpack may work with other final buildpacks, but is currently
untested.

### Usage

Just add this buildpack to your app's list of existing buildpacks. For example:

```yaml
---
applications:
  - name: cf-dotnet-webapp
    buildpacks:
      - openssl_buildpack
      - dotnet_core_buildpack
    memory: 1G
    stack: cflinuxfs4
```

### Building the Buildpack

Since this buildpack is nothing more than a bash script, just run the `create_buildpack.sh` script to package and upload the buildpack to CF. This will increment the version, delete the old version of the buildpack from CF, then create a new version of it.

