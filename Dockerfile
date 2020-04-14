# This Dockerfile is used to build an headles vnc image based on Ubuntu

# FROM ubuntu:18.04
FROM multiplatformautonomy/vscrimmage-headless:v0.4

LABEL maintainer="GTRI DFO MASS Project"

USER 0

ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901
EXPOSE $VNC_PORT $NO_VNC_PORT

# Envrionment config
ENV HOME=/home/scrimmage \
    TERM=xterm \
    NO_VNC_HOME=/usr/share/novnc \
    STARTUPDIR=$HOME/startup \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1664x1008 \
    VNC_PW=vncpassword \
    VNC_VIEW_ONLY=false \
    VNC_CERT="" \
    LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# setup XFCE4, TigerVNC, NoVNC and Websockify
# hadolint ignore=DL3008,DL3015
RUN apt-get update && apt-get install -y xfce4 \
    xfce4-terminal xterm novnc websockify tigervnc-standalone-server \
    tigervnc-common supervisor icewm xterm xfonts-base xauth xinit \
    vim wget net-tools locales bzip2 libnss-wrapper gettext \
    && apt-get purge -y pm-utils xscreensaver* \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# setup xvnc-server & noVNC - HTML5 based VNC viewer
WORKDIR $HOME
COPY ./src/common/xfce/ $HOME/

# configure startup
COPY ./src/common/scripts $STARTUPDIR
RUN ln -s /usr/share/novnc/vnc_auto.html /usr/share/novnc/index.html && \
    chown -R 1000:1000 $HOME/.config && \
    chown -R 1000:1000 $HOME/Desktop && \
    chown 1000:1000 $STARTUPDIR && \
    chmod +x $HOME/wm_startup.sh && \
    chmod +w $STARTUPDIR && \
    echo "source $HOME/.scrimmage/setup.bash" >> $HOME/.bashrc && \
    echo "source $STARTUPDIR/generate_container_user" >> $HOME/.bashrc

# switch to scrimmage user
USER 1000
WORKDIR $HOME

# entrypoint
ENTRYPOINT ["/home/scrimmage/startup/vnc_startup.sh"]
CMD ["--wait"]
