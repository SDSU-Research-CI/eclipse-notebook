FROM gitlab-registry.nrp-nautilus.io/prp/jupyter-stack/desktop

USER root

RUN apt-get -y update && \
    apt-get install -y build-essential && \
    wget "https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2023-03/R/eclipse-cpp-2023-03-R-linux-gtk-x86_64.tar.gz" -O eclipse.tar.gz && \
    tar -xf eclipse.tar.gz -C /opt/

USER $NB_USER