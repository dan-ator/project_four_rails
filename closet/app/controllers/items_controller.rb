class ItemsController < ApplicationController

before_action :authenticate_user!, only: [:create, :update, :destroy]

def index
  @items = Item.all
  render json: @items.to_json, status: :ok
end

def create
  @item = Item.new(item_params)

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

private
def item_params
  params.require(:item).permit(:name, :description, :category, :image)
end

end
