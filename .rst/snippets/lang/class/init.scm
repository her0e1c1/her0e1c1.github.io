
(php "class A {public $v = 'val';} $a=new A(); echo \"$a->v\";")

(ruby #!DOC EOS
class Human
  def initialize(name="")
    @name = name
  end
  attr_accessor :name
end
puts (Human.new "Bob").name
EOS
:str #t)
