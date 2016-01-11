class TagsController < ApplicationController

before_action :authenticate_user!, only: [:create, :update, :destroy]

def index
  @tags = Tag.all
  render json: @tags.to_json, status: :ok
end

def create
  @tag = Tag.new(tag_params)

  if @tag.save
    render json: @tag.to_json, status: :created
  else
    render json: @tag.errors, status: :unprocessable_entity
  end
end

def show
  @tag = Tag.find(params[:id])
  render json: @tag.to_json, status: :ok
end

def update
  @tag = Tag.find(params[:id])
  if @tag.update(tag_params)
    render json: @tag.to_json, status: :ok
  else
    render json: @tag.errors, status: :unprocessable_entity
  end
end

def destroy
  @tag = Tag.find(params[:id])
  @tag.destroy
  render json: {message: "success"}, status: :ok
end

private
def tag_params
  params.require(:tag).permit(:name)
end

end
