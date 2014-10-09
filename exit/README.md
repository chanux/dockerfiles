#Docker: exit

Seeing [tianon/sleeping-beauty](https://github.com/tianon/dockerfiles/tree/master/sleeping-beauty) I thought it would be great for data only containers.

But data only containers needs not keep running. So I made exit. Actually, I just deleted some code from [docker-library/hello-world](https://github.com/docker-library/hello-world). Deal with it.

# Running a data only container

    mkdir ~/.data

    sudo docker run -d -v ~/.data:/data --name data-only-container chanux/exit

# Using the data only container

    sudo docker run -d --volumes-from data-only-container you/my-fancy-container

Now the content in ~/.data will be available at /data in you/my-fancy-container **
