
class PurchasesController < ApplicationController

  respond_to :json

  def popular_purchases_index
    if params[:username].blank?
      @data = "Cannot look up blank username"
      return
    else
      user = User.find(params[:username])
    end

    unless user
      @data = "User with username of #{params[:username]} was not found."
      return
    end

    purchases = Purchase.all_by_user(user.username, 5)

    products = purchases.map do |purchase|
      purchase.product
    end

    products_with_perchasers = []
    products.each do |product|
      purchasers = product.purchases.map do |purchase|
        purchase.user
      end
      products_with_perchasers.push [product, purchasers]
    end

    response = products_with_perchasers.map do |product, purchasers|
      {
        id: product.id,
        face: product.face,
        price: product.price,
        size: product.size,
        recent: purchasers.map do |purchaser|
          purchaser.username
        end
      }
    end

    @data = response
  end

end


