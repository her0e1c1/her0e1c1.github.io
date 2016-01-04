(p"
- component +operation <- ConcreatComponent
- component +operation <- Decorator
- decorator <>-- component
- decorator <- ConcreteDecorator

箱と中身の両方が必要
中身は単体でも存在できるが、箱は中身がないといけない
複数の箱を重ねることができる
箱と中身を合わせたものは、また別の箱の中身として振舞うことができる
中身のある箱は、装飾された中身として、元の中身と同じように振舞うことができる
")

(sphinx-run-from-path "DecoratedHuman.py")
