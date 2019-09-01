# Docker-kubectl for CI/CD

Minimal docker image containing kubectl intended for use in CI/CD environments.

**Note:** this image is currently only tested against Rancher based Kubernetes clusters. More testing and changes welcome.

## Usage

1) If desired, create a user for use by your CI/CD environment
1) Create a kubeconfig file and then base64 encode it
1) In your CI/CD system create a variable called KUBERNETES_CONFIGURATION and paste in the base64 encoded value. You can also assign this a variable locally for testing, of course.
1) `docker run --rm -ti dustinrue/docker-kubectl:latest kubectl version` should work as expected against your Kubneretes cluster

## Changes
* Ensure ca certs are installed
* Pass in an env var containing base64 encoded kubectl config file
* Introduce entrypoint.sh script that writes out the kubeconfig data from the env var


## Credits

This image is based off of Docker-kubectl at https://github.com/roffe/docker-kubectl
