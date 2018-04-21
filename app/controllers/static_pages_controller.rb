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
    
    #@user = User.find(current_user.id)
    #@recentSales = Orderitem.where(created_at: 24.hours.ago..Time.now)
    #@recentSales = Orderitem.last(3)
    
    #select artist from items where items.title = 
    
    #@latestOrder = select first 1 * from orders
    #order by order_date desc;
    
    #@latestOrder = Order.order('order_date desc')
    
    @user = User.find(current_user.id)
    
    @recentPurchases = Orderitem.order("created_at").last(3)
    
    

    #@recentPurchases = @user.orderitems.all  
    
    #@latestPurchases= @recentPurchases.order("created_at").last(3)
    
    
    
    #@latestOrderDetails = select items.artist, items.title from items, orderitems where items.title = orderitems.title  
    
  end
  
  
  
  def paid
    
    flash[:notice] = "Transaction Complete"
    
    @order = Order.last
    
    @order.update_attribute(:status, "Paid by User: #{current_user.email}")
    
    session[:cart] = nil;
    
    #Use raw SQL to find the titles with most duplicates in the orderitems table, and limit the search to the top 3.
    #Assign the top 3 records returned to the variable topSellers
    
    @topSellers = Orderitem.find_by_sql("select title, artist, image, count(*) as count from orderitems group by title order by count desc limit 4")
    
   
    
  end
  
  
  
  
end
