class OutfitItemsController < ApplicationController

skip_before_filter :verify_authenticity_token

def index
  @outfit = Outfit.find(params[:outfit_id])
  @outfit_items = @outfit.outfit_items
  @items = @outfit_items.map { |outfit_item|outfit_item.item  }
  render json: @items.to_json, status: :ok
end

end
