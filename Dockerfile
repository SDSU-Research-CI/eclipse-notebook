FROM gitlab-registry.nrp-nautilus.io/prp/jupyter-stack/desktop

USER root

RUN apt-get -y update && \
    apt-get install -y build-essential && \
    wget "https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2023-03/R/eclipse-cpp-2023-03-R-linux-gtk-x86_64.tar.gz" -O eclipse.tar.gz && \
    tar -xf eclipse.tar.gz -C /opt/ && \
    touch /home/jovyan/Desktop/eclipse.desktop && \
    echo "[Desktop Entry] 
    Version = 2023‑03
    Type = Application
    Terminal = false
    Name = Eclipse C/C++
    Exec = /opt/eclipse/eclipse
    Icon = /opt/eclipse/icon.xpm
    Categories = Application;" > /home/jovyan/Desktop/eclipse.desktop

USER $NB_USER