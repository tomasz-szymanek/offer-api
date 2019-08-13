class UsersController < ApplicationController
  include Response

  def show_by_mail
  	user = User.find_by email: params[:email]
    json_response(user)
  end
end
