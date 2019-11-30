class WishlistController < ApplicationController
before_action :authenticate_user!

def addToWish
    # get the Id of the product
    id = params[:id]
    
   # if the wishlist is already been created, use existing list else create a blank list
  if session[:wishlist] then
    wishlist = session[:wishlist]
  else
    session[:wishlist] = {}
    wishlist = session[:wishlist]
  end
  #If the product is already added it should not increase
  if wishlist[id] then
    wishlist[id] = wishlist[id] + 0
  else
    wishlist[id]= 1
  end  
  
    redirect_to :action => :index
  
end

def clearWishlist
  #sets session variable to nil and bring back to index
  session[:wishlist] = nil
  redirect_to :action => :index
end 

def remove
    
    id = params[:id]
    wishlist = session[:wishlist]
    wishlist.delete id
    
    redirect_to :root
end
 
  
def index
    #passes a wishlist to display
    if session[:wishlist] then
      @wishlist = session[:wishlist]
    else
      @wishlist = {}
    end
end

end
