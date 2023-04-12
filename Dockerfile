FROM gitlab-registry.nrp-nautilus.io/prp/jupyter-stack/desktop

USER root

RUN apt-get -y update && \
    apt-get install -y build-essential && \
    wget "https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2023-03/R/eclipse-cpp-2023-03-R-linux-gtk-x86_64.tar.gz" -O eclipse.tar.gz && \
    tar -xf eclipse.tar.gz -C /opt/ && \
    touch /usr/share/applications/eclipse.desktop && \
    echo -e "[Desktop Entry]\n
    Version = 2023‑03\n
    Type = Application\n
    Terminal = false\n
    Name = Eclipse C/C++\n
    Exec = /opt/eclipse/eclipse\n
    Icon = /opt/eclipse/icon.xpm\n
    Categories = Application;" > /usr/share/applications/eclipse.desktop

USER $NB_USER