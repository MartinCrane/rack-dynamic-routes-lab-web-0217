class Item

  @@items = []
  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
  end

  def items
    @@items
  end

end
