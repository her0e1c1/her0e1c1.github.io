# IMPLEMENT: CSV Parser


class CSV(object):

    def __init__(self, delimiter=",", quote='"', new_line="\n", is_trim=True):
        self.delimiter = delimiter
        self.quote = quote
        self.new_line = new_line
        self.is_trim = is_trim

    def parse(self, s):
        lines = []
        for l in self.read(s):
            lines.append(l)
        return lines

    def read(self, s):
        size = len(s)
        index = 0
        start_at = 0
        end_at = 0
        in_string = False
        lines = []
        while True:
            if index == size:
                if lines:
                    yield lines
                break

            # you can access s at index + 0
            s0 = s[index]
            if not in_string:
                if s0 == self.delimiter:
                    if end_at < start_at:
                        end_at = start_at
                    lines.append(s[start_at:end_at])
                    start_at = index + 1
                    while start_at < size and s[start_at] == ' ':
                        start_at += 1
                        index += 1

                elif s0 == self.quote:
                    start_at = index + 1
                    in_string = True

                elif s0 == self.new_line:
                    if end_at < start_at:
                        end_at = start_at
                    lines.append(s[start_at:end_at])
                    yield lines
                    lines = []
                    start_at = index + 1
                    while start_at < size and s[start_at] == ' ':
                        start_at += 1
                        index += 1

                if self.is_trim:
                    if s0 != " ":
                        end_at = index + 1
            else:
                if s0 == self.quote:
                    # end of string
                    lines.append(s[start_at:index])
                    in_string = False
                    start_at = index + 1
                elif s0 == "\\":
                    if index + 1 == size:
                        pass
                    else:
                        s1 = s[index + 1]
                        if s1 == self.quote:
                            index += 1

            index += 1


if __name__ == "__main__":
    print(CSV().parse("""
abc, efg  , aiu ,   ,  aa bb , d 
 test, " aiueo, ka
kiku " , aaa  ,     
aa , "ab\\"cd",d """))
