
# ord
printf "%x" \'a  # 61
printf "%x" \'か  # 304b

# utf-8
perl -CS -le 'print chr shift' 128520
#😈

# あぃいぅうぇえぉお
ghc -e "mapM putChar ['あ'..'お']"
ruby -e 'print ("あ".."お").to_a.join(" ")'