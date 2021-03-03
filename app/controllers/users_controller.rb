class UsersController < ApplicationController
  def profile
    @buyer_preference = BuyerPreference.new
  end
end
