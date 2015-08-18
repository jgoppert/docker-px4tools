FROM jupyter/jupyterhub:latest

MAINTAINER James Goppert <james.goppert@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update --fix-missing

RUN apt-get -y upgrade

RUN apt-get -y install \
    vim wget

RUN pip install terminado --upgrade

RUN pip3 install terminado --upgrade


# Add default user
RUN useradd -d /home/admin -m admin; \
    echo "admin:admin" | chpasswd; \
    adduser admin sudo

# Start jupyterhub on boot
CMD jupyterhub -f /srv/jupyterhub/jupyterhub_config.py

# Python 2 and 3 SciPy stack and more
RUN apt-get -y install \
    python-mpi4py python3-mpi4py \
    cython cython3 \
    python-mako python3-mako \
    libgeos-dev gfortran
    
RUN apt-get -y build-dep \
    python-numpy python-scipy \
    python-matplotlib python-pandas \
    python-sympy python-nose2
    
RUN pip install \
    numpy scipy matplotlib pandas sympy nose2 \
    plotly shapely mpld3 terminado --upgrade

RUN pip3 install \
    numpy scipy matplotlib pandas sympy nose2 \
    plotly shapely mpld3 terminado --upgrade
