# options
# -s separator
# -w padding zero
# -t the last charactor
# -f FORMAT

# 08 09 10
seq -t "\n" -s " " -w 8 10

# "%g" "%f"
seq -f "%03g" 1 10