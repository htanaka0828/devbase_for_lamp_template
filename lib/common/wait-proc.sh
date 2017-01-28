#!/bin/bash
# dockerコンテナのプロセスが終了(または起動)するまで待つ

TGT=${1}            #対象コンテナ
PROCESS=${2}        #調べるプロセス名
YN=${3:-"end"}      #endなら終了を検知、それ以外の文字列なら起動したかどうかを検知する
MAX=${4:-"1"}       #終了と判定するまでの出現回数
SLEEP=${5:-"0.5"}     #sleep時間

#メッセージ
echo -n "waiting for ${2} ${YN} on ${TGT}..."

[ "${YN}" = "end" ] && CODE="" || CODE="!"
CNT=0
#x回連続で正常なら次に進む
while [ ${CNT} -lt ${MAX} ]; do
  docker exec ${TGT} ps aux | grep ${2} >/dev/null 2>&1
  #プロセスが存在していればそのまま。存在しなくなったらカウントアップ
  [ ${CODE} $? -eq 0 ] && CNT=0 || CNT=$((${CNT} + 1))
  sleep ${SLEEP}
  echo -n "."
done
echo "ok."
