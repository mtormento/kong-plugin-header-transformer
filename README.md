# Kong Header Transformer

A Kong plugin that transforms response headers.

## Description

Since the offical Response Transformer plugin does not allow the transformation of existing headers I decided to implement a plugin to do just that.

## Installation

### Development

Navigate to kong/plugins folder and clone this repo

<pre>
$ cd /path/to/kong/plugins
$ git clone https://github.com/mtormento/kong-plugin-header-transformer header-transformer
$ cd header-transformer
$ luarocks make *.rockspec
</pre>

To make Kong aware that it has to look for the header-transformer plugin, you'll have to add it to the custom_plugins property in your configuration file.

<pre>
custom_plugins:
    - header-transformer
</pre>

Restart Kong and you're ready to go.

## luarocks

<pre>
$ luarocks install kong-plugin-header-transformer
</pre>

## Usage

### Parameters

| Parameter                              | Required | Default           | Description                                                                                                                                                                                                                                                                                                                                                                              |
| -------------------------------------- | -------- | ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| name                                   | yes      |                   | The name of the plugin to use, in this case `header-transformer`.                                                                                                                                                                                                                                            |
| service_id                             | semi     |                   | The id of the Service which this plugin will target.                                                                                                                                  |
| route_id                               | semi     |                   | The id of the Route which this plugin will target.                                                                                                                                  |
| enabled                                | no       | `true`            | Whether this plugin will be applied.                                                                                                                                 |
| config.headers                         | yes      |                   | Array of header transformations (format is `header:transformation`, use `${source_header}` to source content from another header) |                                                                                                                                        |

## Author
Marco Tormento

## License
<pre>
The MIT License (MIT)
=====================

Copyright (c) 2020 Marco Tormento

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
</pre>
