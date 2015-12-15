class Human
  def initialize(name="")
    @name = name
  end
  attr_accessor :name
end

puts (Human.new "Bob").name
