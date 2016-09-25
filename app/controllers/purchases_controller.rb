
class PurchasesController < ApplicationController

  respond_to :json

  def popular_purchases_index
    if params[:username].blank?
     @data = "Cannot look up blank username"
    else
      user = User.find(:username, params[:username])
      @data = user ? params[:username] : "User with username of #{params[:username]} was not found."
    end
  end

end


