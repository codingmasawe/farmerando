class UsersController < ApplicationController
  def profile
    @buyer_preference = BuyerPreference.new
  end

# def show
#   if current_user.has_role? :manager
#     manager_dashboard
#   else
#     operator_dashboard
#   end
# end

# private

# def manager_dashboard
#   # load data required for managers
#   render role_template
# end

# def operator_dashboard
#   # load data required for operators
#   render role_template
# end
end
