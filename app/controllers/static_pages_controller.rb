class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
  end

  def about
  end
  
  def category
    catName = params[:title]
    
    @items = Item.where("genre like ?", catName)
  end

  def contact
  end
  
  def editprofile
  end
  
end
