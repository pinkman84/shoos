require('pg')
require_relative('../db/sql_runner')

class Shoe
  attr_accessor(:first_name, :last_name, :address, :shoe_type, :quantity, :size)
  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @address = options['address']
    @shoe_type = options['shoe_type']
    @quantity = options['quantity'].to_i
    @size = options['size'].to_i
  end

  def customer_name
    customer = @first_name + " " + @last_name
  end

  def customer_order
    customer = @quantity.to_s + " " + @size.to_s
  end

  def save()
    sql = "INSERT INTO shoe_orders (first_name, last_name, 
      address,
      shoe_type, 
      quantity, 
      size) VALUES (
      '#{@first_name}',
      '#{@last_name}',
      '#{@address}',
      '#{@shoe_type}',
      #{@quantity},
      #{@size}
      ) "
      return Shoe.map_item(sql)
  end

  # def self.all()
  #   sql = "SELECT * FROM shoe_orders"
  #   return Shoe.map_item(sql)
  # end

  def self.all()
    db = PG.connect({dbname: 'shoos', host: 'localhost'})
    sql = "SELECT * FROM shoe_orders"

    shoes = db.exec(sql)
    result = shoes.map {|shoe| Shoe.new(shoe)}
    db.close
    return result
  end

  def self.map_items(sql)
     shoes = SqlRunner.run(sql)
     result = shoes.map { |shoe| Shoe.new(shoe)}
   end

   def self.map_item(sql)
     result = Shoe.map_items(sql)
     return result.first
   end


end