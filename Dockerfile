FROM gitlab-registry.nrp-nautilus.io/prp/jupyter-stack/desktop:v1.3

USER root

RUN apt-get -y update && \
    apt-get install -y build-essential && \
    wget "https://mirror.umd.edu/eclipse/technology/epp/downloads/release/2023-12/R/eclipse-cpp-2023-12-R-linux-gtk-x86_64.tar.gz" -O eclipse.tar.gz && \
    tar -xf eclipse.tar.gz -C /opt/ && \
    touch /usr/share/applications/eclipse.desktop && \
    echo -e "[Desktop Entry]\nVersion = 2023-12\nType = Application\nTerminal = false\nName = Eclipse C/C++\nExec = /opt/eclipse/eclipse\nIcon = /opt/eclipse/icon.xpm\nCategories = Application;" > /usr/share/applications/eclipse.desktop && \
    chmod +x /usr/share/applications/eclipse.desktop &&\
    touch /etc/novnc.conf &&\
    echo "WebClipboard.enabled: true" >> /etc/novnc.conf &&\
    echo "SendClipboard: both" >> /etc/novnc.conf

USER $NB_USER
