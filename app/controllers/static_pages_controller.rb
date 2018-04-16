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
  
  def paid
    
    flash[:notice] = "Transaction Complete"
    
    @order = Order.last
    
    @order.update_attribute(:status, "Paid by User: #{current_user.email}")
    
    session[:cart] = nil;
    
  end
  
  
end
