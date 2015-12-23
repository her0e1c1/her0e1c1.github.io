
(cpp "string s; s=char('A' + 1); P(s)")
(cpp "string s; s='A'+1; P(s)")
(cpp "string s='A'+1;" :warn "cannot declare with char")
