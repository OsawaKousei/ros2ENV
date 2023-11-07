FROM n622jwith/ros2-mini

ARG WORK_DIR=/root

#ignition gazeboインストール
RUN apt-get update -q && \
    apt-get install -y lsb-release wget gnupg && \
    wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
    apt-get update -q && \
    apt-get install -y ignition-fortress && \
    rm -rf /var/lib/apt/lists/*

#ROS2パッケージインストール
RUN apt-get update -q && \
    apt install -y ros-humble-ros-ign && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

