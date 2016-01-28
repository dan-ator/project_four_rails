class OutfitItemsController < ApplicationController

skip_before_filter :verify_authenticity_token

def index
  @outfit = Outfit.find(params[:outfit_id])
  @outfit_items = @outfit.outfit_items
  render json: @outfit_items.to_json(include: :item), status: :ok
end


end
