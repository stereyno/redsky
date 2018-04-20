class CartController < ApplicationController
  
  
  before_action :authenticate_user!
  
  
  def add
    # get id of the product
    id = params[:id]
    
    # if the cart session is already created, use existing session
    
    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end


    # check if the product is already in the cart, if so increment by 1
    
    if cart[id] then
      cart[id] = cart[id] + 1
    else
      cart[id] = 1
    end 
    
    redirect_to :action => :index
    
  end
  
  
  def clearCart
    #clear and remove all items
    session[:cart] = nil
    redirect_to :action => :index
    
  end
  
 
  
  def index
    
    #pass the cart information to the index view
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
    
  end
  
  
  
  def remove
    
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    
    redirect_to :action => :index
    
  end
  
  
  
  def clearCart
    
    session[:cart] = nil
    redirect_to :action => :index 
    
  end
  
  
  def createOrder
    
    @user = User.find(current_user.id)
    
    @order = @user.orders.build(:order_date => DateTime.now, :status => 'Pending')
  
    @order.save
  
    @cart = session[:cart] || {}
  
    @cart.each do | id, quantity |
      item = Item.find_by_id(id)
      
      
      #@orderitem = @order.orderitems.build(:item_id => item.id, :title => item.title, :quantity => quantity, :price => item.price)
      @orderitem = @order.orderitems.build(:item_id => item.id, :artist => item.artist, :title => item.title, :image => item.image, :quantity => quantity, :price => item.price)
    @orderitem.save  
    
  end
  
  @orders = Order.all
  
  @orderitems = Orderitem.where(order_id: Order.last)
  end
end