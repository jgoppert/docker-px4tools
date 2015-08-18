FROM ipython/scipyserver

MAINTAINER James Goppert <james.goppert@gmail.com>

RUN pip2 install px4tools 

# matplotlib-toolkits
RUN apt-get -y install libgeos-dev && \
    cd /usr/local/src && git clone https://github.com/matplotlib/basemap.git && \
    export GEOS_DIR=/usr/local && \
    cd basemap && python setup.py install

# Pillow (PIL)
RUN apt-get -y install zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev && \
    pip install Pillow && \
    cd /usr/local/src && git clone https://github.com/vitruvianscience/opendeep.git && \
    cd opendeep && python setup.py develop


RUN sudo apt-get -y remove python-tornado python3-tornado
RUN pip2 install tornado --upgrade
RUN pip3 install tornado --upgrade

# Start jupyterhub on boot
CMD ["/notebook.sh"]
