require('minitest/autorun')
require('minitest/rg')
require_relative('../models/shoe')

class TestShoe < Minitest::Test

  def setup
    options = {
      'first_name' => 'Aidan',
      'last_name' => 'Pinkman',
      'address' => 'Code Clan, Castle Tce, Edinburgh',
      'quantity' => 2,
      'size' => 11}
      @shoe = Shoe.new(options)
  end

  def test_first_name
    assert_equal('Aidan', @shoe.first_name)
  end

  def test_last_name
    assert_equal('Pinkman', @shoe.last_name)
  end

  def test_quantity
    assert_equal(2, @shoe.quantity)
  end

  def test_size
    assert_equal(11, @shoe.size)
  end

  def test_customer_name
    assert_equal('Aidan Pinkman', @shoe.customer_name)
  end

  def test_customer_order
    assert_equal('2 11', @shoe.customer_order)
  end



end