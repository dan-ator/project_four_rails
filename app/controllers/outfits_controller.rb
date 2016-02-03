class OutfitsController < ApplicationController

before_action :authenticate_user!

def index
  @outfits = Outfit.all
  render json: @outfits.to_json, status: :ok
end

def create
  @outfit = Outfit.new(outfit_params)

  if @outfit.save
    render json: @outfit.to_json, status: :created
  else
    render json: @outfit.errors, status: :unprocessable_entity
  end
end

def show
  @outfit = Outfit.find(params[:id])
  render json: @outfit.to_json, status: :ok
end

def update
  @outfit = Outfit.find(params[:id])
  if @outfit.update(outfit_params)
    render json: @outfit.to_json, status: :ok
  else
    render json: @outfit.errors, status: :unprocessable_entity
  end
end

def destroy
  @outfit = Outfit.find(params[:id])
  @outfit.destroy
  render json: {message: "success"}, status: :ok
end



private
def outfit_params
  params.require(:outfit).permit(:name, :category)
end

end
