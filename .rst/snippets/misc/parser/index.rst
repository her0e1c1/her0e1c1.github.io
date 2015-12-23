
========
 Parser
========


.. toctree::
   :maxdepth: 1 
   :glob:

   ./parser/*


Parsing Expression Grammar
==========================

- https://ja.wikipedia.org/wiki/Parsing_Expression_Grammar

..

    RE_KEYWORD = re.compile(r'(".+?"|\S+)', re.UNICODE)

    def parse(kw):
        start = 0
        matching_keywords = []
        while True:
            match = RE_KEYWORD.search(kw, start)
            if match:
                start = match.end()
                m = match.group()
                if m.startswith('"'):
                    # ""で囲まれた場合は、前後の"を除外
                    # "が連続した場合もまとめて削除
                    m = m.strip('"')
                    # 空文字の場合を除外
                m = m.strip()
                if m:
                    matching_keywords.append(m)
        else:
            break
        return matching_keywords
