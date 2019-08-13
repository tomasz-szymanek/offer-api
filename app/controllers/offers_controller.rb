class OffersController < ApplicationController
	include Response

 	def index
  	@user = User.find(params[:user_id])
  	@offers = Offer.where(user_id: @user.id, status: "pending")
  	render json: @offers, include: :line_items
  end

  def show
  	@offer = Offer.find(params[:id])
  	render json: @offer, include: :line_items
  end

  def accept
  	@offer = Offer.find(params[:offer_id])
  	line_items = @offer.line_items.select { |item| params[:selected_line_items].include? item.id }
  	@offer.line_items = line_items
  	@offer.status = "accepted"
  	render status: 200, json: @offer.save
  end

  def reject
  	@offer = Offer.find(params[:offer_id])
  	@offer.status = "rejected"
  	render status: 200, json: @offer.save
  end
end
