# Translate string capitilized
perl -pE 'tr/a-z/A-Z/' s1.txt
ruby -pe '$_.tr!("a-z", "A-Z")' s1.txt
ls | tr '[:lower:]' '[:upper:]'