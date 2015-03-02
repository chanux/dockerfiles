# Docker - Gitreceive

Gitreceive https://github.com/progrium/gitreceive

Build the image and run it as follows

`docker build -t gitreceive .`
`docker run gitreceive`

To allow someone push to gitreceive, you need to add their public key.

`cat /path/to/user/key.pub | ssh -i sshkey root@<DOCKER_HOST> -p <CONTAINER_PORT> "gitreceive upload-key <username>"`

The container will expose port 22 (default ssh port) and have a docker volume mounted at /home/git.

A simple receiver script added so it will print out repo details when you push.

*The ssh keys are provided for convenience. You must create your own in any serious use.*
