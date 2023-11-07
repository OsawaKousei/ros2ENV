#--------競合するフォルダを削除
#rm -rf <クローンするレポジトリ名>
#クローンするレポジトリ名と同じファイルがコンテナ内になければコメントアウトしてよい
rm -rf ros2_ws

#----------レポジトリをクローン
#git clone <クローンするレポジトリのリンク>
git clone git@github.com:OsawaKousei/ros2_ws.git

#----------ros2_wsの初期設定
cd ros2_ws
#初期で使いたいブランチを指定
git pull origin dockerENV
git checkout dockerENV
rm -rf install 
rm -rf build 
rm -rf log
colcon build

#gitに反映
git add .
git commit -m initializedNewENV
git push