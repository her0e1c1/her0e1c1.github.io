
# Count number of files in a direcory
find . | wc -l

# Count lines of files in a direcory
find . | xargs cat | wc -l


# wc -l
ls |perl -nE '$a++; END{say $a}'
ls |ruby -ne 'BEGIN{$a=0}; $a+=1; END{p $a};'
# The Eskimo Greeting Operator }{
ls|perl -nE '$a++ }{say $a'

# wc -c
cat oneliner.pl |perl -nE '$a+=length; END{say $a}'
cat s1.txt |ruby -ne 'a||=0; a+=$_.size; END{p a};'
cat s1.txt |ruby -ne 'BEGIN{$a=0}; $a+=$_.size; END{p $a};'