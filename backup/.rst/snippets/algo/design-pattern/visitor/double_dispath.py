# visitor.visit(acceptor)
# acceptor.accept(visitor)


class Visitor(object):
    def visit(self, acceptor):
        # here, just accept visit
        return acceptor.accept(self)

    # These code below can be written in the accept classes.
    def visit_List(self, acceptor):
        assert len(acceptor.children) >= 2
        op = self.visit(acceptor.children[0])
        args = [self.visit(n) for n in acceptor.children[1:]]
        return op(args)

    def visit_Op(self, acceptor):
        return acceptor.op

    def visit_Atom(self, acceptor):
        return acceptor.value


class Acceptor(object):
    pass


class List(Acceptor):
    def __init__(self, children):
        assert isinstance(children, list)
        self.children = children

    def accept(self, visitor):
        return visitor.visit_List(self)


class Op(Acceptor):
    def __init__(self, op):
        # op takes only a list as an argument
        self.op = op

    def accept(self, visitor):
        return visitor.visit_Op(self)


class Atom(Acceptor):
    def __init__(self, value):
        self.value = value

    def accept(self, visitor):
        return visitor.visit_Atom(self)


def main():
    v = Visitor()
    print(v.visit(List([Op(sum), Atom(1), Atom(2)])))
    print(v.visit(List([Op(sum),
                        Atom(1),
                        List([Op(min),
                              Atom(1),
                              Atom(2)]),
                        List([Op(len),
                              Atom(1),
                              Atom(2),
                              Atom(3)])
                        ])))


if __name__ == "__main__":
    main()