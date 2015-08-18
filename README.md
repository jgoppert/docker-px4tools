# docker-px4tools

Dependencies:

    sudo apt-get install docker.io

Run this by:

    sudo docker run -i -t -p 8000:8888 -v /home/jupyterhub:/notebooks -e "PASSWORD=yourpassword" px4tools

Open browser and go to:

    http://localhost:8000
