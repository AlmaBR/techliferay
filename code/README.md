# Cloud Infrastructure Interview test

Some security best practices were ignored for convenience purposes, the config files, hardcoded auth keys and values for environments should 
not be uploaded to the repository. But it would be impractical to share the values via e-mail, so the values were kept here.
Ideally the values should be stored on a vault (like AWS KMS) and accessed programatically.
 
## Kunernetes

The clusters were created using minikube. The shell files for this test use minikube 
The deployment order should be:
Mariadb
Server
Nginx

To use the private image, run the configClusterPrivateDocker.sh and add the lines
imagePullSecrets:
  - name: dockercreds

to the backend-deployment file after the containers part of the spec

## Docker

The credentials for reading from the private repo and for read/write the public repo were provided here, as I said before, those values
should be stored on another service, but are here for convenience. The private read/write credentials will be providade via e-mail
The shellfiles for pushing the images take the tag as input, pushPublic 0.1.1
