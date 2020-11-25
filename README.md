# Kong Header Transformer

A Kong plugin that transforms request and response headers.

## Description

Since the offical Request and Response transformers plugins do not allow to modify existing headers I decided to implement a plugin to do just that.

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
| name                                   | yes      |                   | The name of the plugin to use, in this case `secure-box-decrypter`.                                                                                                                                                                                                                                                                                                                              |
| service_id                             | semi     |                   | The id of the Service which this plugin will target.                                                                                                                                                                                                                                                                                                                                     |
| route_id                               | semi     |                   | The id of the Route which this plugin will target.                                                                                                                                                                                                                                                                                                                                       |
| enabled                                | no       | `true`            | Whether this plugin will be applied.                                                                                                                                                                                                                                                                                                                                                     |
| config.securebox_url                   | yes      |                   | SecureBox service url (ex. http://sb:8000/securebox).                                                                                                                                                                                                                                                                                                                |
| config.timeout                         | yes      | 10                | Timeout for SecureBox requests in seconds.                                                                                                                                                                                                                                                                                                                          |
| config.keychain                        | yes      |                   | SecureBox keychain to use.
| config.keys_to_decrypt                 | yes      |                   | Set of keys to decrypt.

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
