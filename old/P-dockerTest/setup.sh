#!/bin/bash -e 

# 環境設定
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

#ワークスペースの作成
mkdir ~/ros2_ws
cd ~/ros2_ws && colcon build
echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc

#環境設定を反映
source ~/.bashrc