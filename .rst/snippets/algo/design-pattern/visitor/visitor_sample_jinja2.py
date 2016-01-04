# Visitor pattern is used by jinja2 or restructuredtext


class Visitor(object):
    def visit(self, node):
        return getattr(self, "visit_%s" % node.__class__.__name__)(node)

    def visit_List(self, node):
        assert len(node.children) >= 2
        op = self.visit(node.children[0])
        args = [self.visit(n) for n in node.children[1:]]
        return op(args)

    def visit_Op(self, node):
        return node.op

    def visit_Atom(self, node):
        return node.value


# acceptor
class Node(object):
    pass


class List(Node):
    def __init__(self, children):
        assert isinstance(children, list)
        self.children = children


class Op(Node):
    def __init__(self, op):
        # op takes only a list as an argument
        self.op = op


class Atom(Node):
    def __init__(self, value):
        self.value = value


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