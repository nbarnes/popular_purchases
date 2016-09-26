class Purchase

  def self.all_by_user(username, limit = nil)
    purchases = nil
    unless @@purchases_by_username.has_key? username
      purchases = fetch_purchases_by_username(username)
    end
    purchases = @@purchases_by_username[username]
    (purchases = purchases.take limit) if limit
    return purchases
  end

  def self.all_by_product_id(product_id, limit = nil)
    purchases = nil
    unless @@purchases_by_product_id.has_key? product_id
      fetch_purchases_by_product_id product_id
    end
    purchases = @@purchases_by_product_id[product_id]
    (purchases = purchases.take limit) if limit
    return purchases
  end

  def product
    return Product.find @product_id
  end

  def user
    return User.find @username
  end

  private
    @@purchases_by_username = {}
    @@purchases_by_product_id = {}

    attr_accessor :username, :product_id, :id, :date

    def initialize(id, product_id, username, date)
      @id = id
      @product_id = product_id
      @username = username
      @date = date
    end

    def self.fetch_purchases_by_username(username)
      purchases = []
      response = Rails.cache.fetch("purchases_by_username_#{username}", expires_in: 1.hour) do
        HTTParty.get("http://74.50.59.155:6000/api/purchases/by_user/#{username}")["purchases"]
      end
      response.each do |purchase_response|
        purchases.push Purchase.new(purchase_response["id"], purchase_response["productId"], purchase_response["username"], purchase_response["date"])
      end
      @@purchases_by_username[username] = purchases
    end

    def self.fetch_purchases_by_product_id(product_id)
      purchases = []
      response = Rails.cache.fetch("purchases_by_product_#{product_id}", expires_in: 1.hour) do
        HTTParty.get("http://74.50.59.155:6000/api/purchases/by_product/#{product_id}")["purchases"]
      end
      response.each do |purchase_response|
        purchases.push Purchase.new(purchase_response["id"], purchase_response["productId"], purchase_response["username"], purchase_response["date"])
      end
      @@purchases_by_product_id[product_id] = purchases
    end
end
