class UserController < ApplicationController
    
    
    def login
        
        session[:login] = 1
        flash[:notice] = "Say Hello"
        redirect_to :controller => :items
    
    end
    
    
    def logout
        
        session[:login] = nil
        flash[:notice] = "Wave Goodbye"
        redirect_to :controller => :items
        session[:cart] = nil
        
    end
    
    
end
