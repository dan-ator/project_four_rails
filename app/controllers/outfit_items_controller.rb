class OutfitItemsController < ApplicationController

skip_before_filter :verify_authenticity_token

def index
  @outfit = Outfit.find(params[:outfit_id])
  @outfit_items = @outfit.outfit_items
  @items = @outfit_items.map { |outfit_item|outfit_item.item  }
  render json: @items.to_json, status: :ok
end



# def show
#   @outfit_item = Outfit.find(params[:id])
#   render json: @outfit_item.to_json, status: :ok
# end
#
#
#
# def destroy
#   @outfit_item = Outfit.find(params[:id])
#   @outfit_item.destroy
#   render json: {message: "success"}, status: :ok
# end
#
# private
# def outfit_items_params
#   params.require(:outfit_item).permit(:name)
# end

end
