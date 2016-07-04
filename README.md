# masala_dcos-cookbook

This is a component of the [masala toolkit](https://github.com/PaytmLabs/masala).

This is a [wrapper cookbook](http://blog.vialstudios.com/the-environment-cookbook-pattern/#thewrappercookbook) for providing recipes for Mesosphere DC/OS deployment.

## Supported Platforms

The platforms supported are:
- Centos 7.1+

## Attributes

Please see the documentation for the cookbooks included by masala_dcos. (See [metadata.rb](https://github.com/PaytmLabs/masala_dcos/blob/develop/metadata.rb) file)

This cookbook does not add any attributes of it's own.

## Usage

### masala_dcos::default

Include `masala_dcos` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[masala_dcos::default]"
  ]
}
```

## License, authors, and how to contribute

See:
- [LICENSE](https://github.com/PaytmLabs/masala_spark/blob/develop/LICENSE)
- [MAINTAINERS.md](https://github.com/PaytmLabs/masala_spark/blob/develop/MAINTAINERS.md)
- [CONTRIBUTING.md](https://github.com/PaytmLabs/masala_spark/blob/develop/CONTRIBUTING.md)

