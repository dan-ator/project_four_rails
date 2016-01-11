class OutfitsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

def index

end

def new

end

def create

end

def show

end

def edit

end

def update

end

def destroy

end

# private
# def profile_params
#   params.require(:profile).permit(:info, :facebook_url, :blog_url, :other_url)
# end

end
