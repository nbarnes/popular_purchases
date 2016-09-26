class Product

  attr_accessor :id, :face, :size, :price

  def self.find(id)
    unless @@products.has_key? id
      fetch_product id
    end
    return @@products[id]
  end

  def purchases
    return Purchase.all_by_product_id @id
  end

  private
    @@products = {}

    def initialize(id, face, size, price)
      @id = id
      @face = face
      @size = size
      @price = price
    end

    def self.fetch_product(id)
      response = Rails.cache.fetch("product_#{id}", expires_in: 1.hour) do
        HTTParty.get("http://74.50.59.155:6000/api/products/#{id}")['product']
      end
      @@products[id] = Product.new(response['id'], response['face'], response['size'], response['price'])
    end

end
