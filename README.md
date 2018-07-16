# docker-hugo

Dockerfile for using hugo locally as an alternative to [installing](https://gohugo.io/getting-started/installing/). Built as minimal container.

## Usage

    docker run -it -p 1313:1313 -v $(pwd):/host hugo [flags] [command]

This can be aliased in your `.bash_profile` to use a standard directory and port for troubleshooting. Assuming using a `blog` folder under your home directory:

    alias hugo='docker run -it -p 1313:1313 -v ~/blog:/host hugo'

Reload your terminal session, and you can run `hugo new site .`. Use the current working directory within the container to point to your blog (provided you mapped `/host` to the directory on the host).
