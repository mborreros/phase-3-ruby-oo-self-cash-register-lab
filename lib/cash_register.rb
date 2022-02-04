require "pry"

class CashRegister

  attr_accessor :total, :discount, :items, :last_item, :last_price, :last_quantity
  attr_reader :title

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_item = []
    @last_price = 0
    @last_quantity = 1
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    self.last_quantity = quantity
    while quantity >= 1
      self.items << title
      quantity -=1
    end
    self.last_item = items.last
    self.last_price = price
    
  end

  def apply_discount
    if self.discount == 0 
      "There is no discount to apply."
    else
      applied_discount = (100-discount).to_f/100
      self.total = @total * applied_discount
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
      self.total = @total - self.last_price * self.last_quantity
  end



end
