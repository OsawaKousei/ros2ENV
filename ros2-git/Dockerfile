FROM n622jwith/ros2-gui

ARG WORK_DIR=/root

#----------gitインストール
RUN apt-get update -q && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

#----------鍵認証用のディレクトリをコピー
#予めdockerfileのあるディレクトリに.sshをコピーしておく必要があります
#このDockerfileをビルドしたイメージを公開することはセキュリティ上の深刻な問題をもたらします。
COPY .ssh/ /root/.ssh/

#git初期設定用ファイルをコピー
COPY git-setup.sh /root/