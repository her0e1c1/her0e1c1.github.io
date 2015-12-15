HERE=$(dirname $0)
cat <<EOS

====
Ruby
====

$(go <<EOG

EOG
)

ruby -e 'exec "echo 1"; p "NOT PRINTED"'
ruby -e 'exit'
ruby -e 'exit!'

ruby -e 'puts ENV["PATH"].split(":")'
ruby -e 'p [false, nil].all?'

    # keyを指定
ruby -e 'def add(a: 1, b: 2) a+b end; puts add a: 3'
ruby -e 'def add(a=1, b=2) a+b end; puts add (a=3)'
ruby -e 'def add(*args) args.inject{|acc, it| acc+it} end; puts (add 1, 2, 3)'

ruby -e 'p true ? "ok" : "no"'
struct構造は、特定のkeyを持つ辞書
Foo = Struct.new("Foo", "foo", "bar")
f = Foo.new(1, 2)
p f.foo # 1
p f.bar # 2

class Human
  def initialize(name="")
    @name = name
  end
  attr_accessor :name
end

puts (Human.new "Bob").name

EOS
