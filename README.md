# php sandbox

A docker image containing php-fpm, and an openssh-server.  
My primary usage is to allow my friends to host their PHP projects on my servers, because free hostings suck hard.

## Usage
Build the image:
```bash
# name: Name for the docker image
# username: ssh username
# password: ssh password
docker build --tag=<name> --build-arg="USERNAME=<username>" --build-arg="PASSWORD=<password>" .
```

Run with docker compose:  

> compose.yaml
```yaml
services:
  phpsandbox:
    image: <image name>
    container_name: sandbox1
    ports:
     - <your desired ssh port>:22
```

## License

```
MIT License

Copyright (c) 2025 SunStorm

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```