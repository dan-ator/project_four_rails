class ItemsController < ApplicationController

# before_action :authenticate_user!

def index
  @items = Item.all
  render json: @items.to_json, status: :ok
end

def create
  @item = Item.new(item_params)
  @item.image = params[:file]
  if @item.save
    render json: @item.to_json, status: :created
  else
    render json: @item.errors, status: :unprocessable_entity
  end
end

def show
  @item = Item.find(params[:id])
  render json: @item.to_json, status: :ok
end

def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    render json: @item.to_json, status: :ok
  else
    render json: @item.errors, status: :unprocessable_entity
  end
end

def destroy
  @item = Item.find(params[:id])
  @item.destroy
  render json: {message: "success"}, status: :ok
end

def add_to_outfit
  @item = Item.find(params[:id])
  @outfit = Outfit.find(params[:outfit_id])
  @new_outfit_item = OutfitItem.new({item: @item, outfit: @outfit})
  if @new_outfit_item.save
    render json: @new_outfit_item.to_json, status: :created
  else
    render json: @new_outfit_item.errors, status: :unprocessable_entity
  end
end

def remove_from_outfit
  @outfit_item = OutfitItem.find(params[:outfit_item_id])
  @outfit_item.destroy
  render json: {message: "success"}, status: :ok
end

private
def item_params
  params.permit(:name, :description, :category, :image, :color, :fabric_type)
end

end
