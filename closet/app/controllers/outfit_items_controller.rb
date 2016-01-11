class OutfitItemsController < ApplicationController

before_action :authenticate_user!, only: [:create, :update, :destroy]

def index
  @outfit_items = OutfitItem.all
  render json: @outfit_items.to_json, status: :ok
end

def create
  @outfit_item = Outfit.new(outfit_params)

  if @outfit_item.save
    render json: @outfit_item.to_json, status: :created
  else
    render json: @outfit_item.errors, status: :unprocessable_entity
  end
end

def show
  @outfit_item = Outfit.find(params[:id])
  render json: @outfit_item.to_json, status: :ok
end

def update
  @outfit_item = Outfit.find(params[:id])
  if @outfit_item.update(outfit_params)
    render json: @outfit_item.to_json, status: :ok
  else
    render json: @outfit_item.errors, status: :unprocessable_entity
  end
end

def destroy
  @outfit_item = Outfit.find(params[:id])
  @outfit_item.destroy
  render json: {message: "success"}, status: :ok
end

private
def outfit_items_params
  params.require(:outfit_item).permit(:name)
end

end
