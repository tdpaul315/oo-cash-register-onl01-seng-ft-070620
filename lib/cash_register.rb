class CashRegister
  attr_accessor :total, :discount, :items, :last_item_price
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end


  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    @last_item_price = price * quantity
    while quantity.positive?
      @items << title
      quantity -= 1
    end
  end

  def apply_discount
    if self.discount >0
      self.total -= ((self.discount/100.0)*self.total)
      success_message = "After the discount, the total comes to $#{self.total.to_i}."
      success_message
    else
      failure_message = "There is no discount to apply."
      failure_message
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= @last_item_price
    self.total
  end

end