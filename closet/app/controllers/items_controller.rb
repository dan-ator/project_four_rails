class ItemsController < ApplicationController

skip_before_filter :verify_authenticity_token

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

def add_outfit_item
  @item = Item.find(params[:id])
  @item.outfit_items.create(item_params)
  if @item.outfit_items.save
    render json: @item.outfit_items.to_json, status: :created
  else
    render json: @item.outfit_items.errors, status: :unprocessable_entity
  end
end

def remove_outfit_item
  @item = Item.find(params[:id])
  @item.outfit_items.destroy_all
  render json: {message: "success"}, status: :ok
end

private
def item_params
  params.permit(:name, :description, :category, :image, :color, :fabric_type)
end

end
