

;; #echo '$HISTSIZE =' $HISTSIZE
;; echo '$PWD =' $PWD
;; echo '$HOME =' $HOME
;; echo '$OLDPATH =' $OLDPATH
;; echo '$SECONDS =' $SECONDS


;; getCurrentPID
;; echo $$

for i in 1 2 3; do echo $i; done
echo "hello world"


for i in *.txt; do echo $i |sed -e 's/\.txt/\.csv/' |xargs mv $i ;done 
for i in *.csv; do a=$i; mv $a ${i/\.csv/.txt};done


touch `for i in $(seq -f "%03g" 1 10) ;do printf "%s.csv " $i ;done`
# 001.csv ... 010.csvまでの空ファイルを作成


区切り文字を$IFSとして、配列を生成し、行つきの結果を表示
cnt=0; for i in `ls`; do echo "$cnt $i"; cnt=$((cnt + 1)); done



touch {a,b,c}.{txt,csv}
touch $FILENAME
# Create files with combination. Make sure before you run the command above, echo it, echo {a,b,c}.{txt,csv}
