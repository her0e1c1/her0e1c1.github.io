# Read the first of 5 lines of FILEPATH
head -n 5 $FILEPATH
perl -ne 'print if $. < 5' $FILEPATH
ruby -ne 'print if $. < 5' $FILEPATH
python -c 'import fileinput as fi; print("".join(list(fi.input())[:5]))' $FILEPATH
ghc -e 'readFile "$FILEPATH" >>= putStr . unlines . take 5 . lines'

# if 5..10 == if ($. ~~ start..end)
perl -ne 'print if 5..10' $FILEPATH
ruby -ne 'print if 5..10' $FILEPATH
ghc -e 'readFile "$FILEPATH" >>= putStr . unlines . drop 5 . take 10 . lines'


perl -E 'say chr(0) x (10 ** 6)' > /pool
ruby -e 'print 0.chr * (10 ** 6)' > /pool
python -c 'print(chr(0) * 10**6)' > /pool
ghc -e 'putStr $ take (10 ^ 6) $ repeat $ Data.Char.chr 0' > /pool
node -e 'console.log(Array(Math.pow(10, 6)).join(String.fromCharCode(0)))' > /pool