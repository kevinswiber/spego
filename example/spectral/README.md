# spego-spectral-example

This is an example of using Spectral as a front-end for executing Spego policies. One benefit is that Spectral will resolve any JSON References and also point to line and character information showing where problems have occurred.

Feel free to use this as a template for executing your own policies.

## Usage

You can run this specific ruleset via a URL.

```sh
spectral lint \
  -r https://raw.githubusercontent.com/kevinswiber/spego/main/example/spectral/ruleset.js \
  openapi.json
```

But more than likely, you'll want to bundle your own policies and can use this as a template.

Be sure to follow the [Spectral install instructions](https://meta.stoplight.io/docs/spectral/b8391e051b7d8-installation).

```sh
git clone git@github.com:kevinswiber/spego.git
cd ./spego/example/spectral
npm install
npm run build
spectral lint -r ./ruleset.js ../inputs/openapi.json
```

Furthermore, this ruleset can be extended. See the `example` directory. Example extended Spectral ruleset:

```yaml
extends: [['../ruleset.js', 'recommended']]
rules:
  no-script-tags-in-markdown: error
  no-eval-in-markdown: error
  path-params: false
```
