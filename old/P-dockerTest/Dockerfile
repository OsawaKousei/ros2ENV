#ベースとなるイメージファイル
FROM ubuntu:22.04

#----------初期設定
#初期設定用のパッケージインストール
RUN apt-get update -q && \
    apt-get install -y tzdata \
    language-pack-ja-base \
    language-pack-ja \
    fonts-noto-cjk fcitx-mozc && \
    im-config -n fcitx
#タイムゾーンの設定
ENV TZ=Asia/Tokyo 
#日本語化
ENV GTK_IM_MODULE=xim \
    QT_IM_MODULE=fcitx \
    XMODIFIERS=@im=fcitx \
    DefalutIMModule=fcitx
RUN locale-gen ja_JP.UTF-8  
ENV LANG=ja_JP.UTF-8 \
    LC_ALL=ja_JP.UTF-8

#ワークディレクトリの設定
WORKDIR /root

#OSのアップグレード
RUN apt-get update -q && \
    apt-get upgrade -y && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

#----------ROS2のインストール
#apt-getレポジトリの追加
RUN apt-get update -q && \
    apt install -y curl gnupg2 lsb-release && \
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null && \
    apt-get update -q
#ここではrm -rf /var/lib/apt/lists/*　はやらない方が動作が安定する

#ROS2本体とビルド用パッケージインストール
RUN apt-get update -q && \
    apt-get install -y ros-humble-desktop \
    python3-argcomplete \
    python3-colcon-common-extensions \
    python3-rosdep python3-vcstool && \
    rosdep init && \
    rm -rf /var/lib/apt/lists/*

RUN rosdep update

#ROS2のセットアップ
COPY setup.sh /root/
RUN bash ~/setup.sh