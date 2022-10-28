# spego-spectral-example

This is an example of using Spectral as a front-end for executing Spego policies. One benefit is that Spectral will resolve any JSON References and also point to line and character information showing where problems have occurred.

Feel free to use this as a template for executing your own policies.

## Usage

Be sure to follow the [Spectral install instructions](https://meta.stoplight.io/docs/spectral/b8391e051b7d8-installation).

```sh
git clone git@github.com:kevinswiber/spego.git
cd ./spego/example/spectral
npm install
npm run build
spectral lint ../inputs/openapi.json
```
