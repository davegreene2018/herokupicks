class WishController < ApplicationController

	def index
      if session[:wish] then
      @wish = session[:wish]
    else
      @wish = {}
    end  
	end

	def wishadd
    @user = User.find(current_user.id)
    @items = Item.all

    @wish = session[:wish] || {} # Get the content of the Cart
    @wish.each do | id, quantity |
    item = Item.find_by_id(id)
    @wishitem = @user.wishes.build(:item_id => item.id, :title => item.title, :description => item.description, :image_url => item.image_url, :quantity => quantity, :price=> item.price)
    @wishitem.save
      end
    
  end

  def add
    # get the Id of the product
    id = params[:id]
    
   # if the cart is already been created, use existing cart else create a blank cart
  if session[:wish] then
    wish = session[:wish]
  else
    session[:wish] = {}
    wish = session[:wish]
  end
  #If the product is already added it increments by 1 else product set to 1
  if wish[id] then
    wish[id] = wish[id] + 1
  else
    wish[id]= 1
  end  
  @user = User.find(current_user.id)
    @items = Item.all

    @wish = session[:wish] || {} # Get the content of the Cart
    @wish.each do | id, quantity |
    item = Item.find_by_id(id)
    @wish = @user.wishes.build(:item_id => item.id, :title => item.title, :description => item.description, :image_url => item.image_url, :quantity => quantity, :price=> item.price)
    @wish.save
end

  
    redirect_to :action => :index
  
  end

  def remove
    
    id = params[:id]
    wish = session[:wish]
    wish.delete id
    
    redirect_to :action => :index
  end

end
