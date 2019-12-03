class StaticPagesController < ApplicationController
  def home
    @orders = Order.all
    @orderitems = Orderitem.all
    @items = Item.all
    
    @categories = Category.all
  end
  
  def fender
    brand = params[:brand]
    #@items = Item.where("brand like ?", "%#{fender}%")
    
     # @items = Item.where('brand ILIKE ?', '%fender%').all # posql
      @items = Item.where('brand like?', '%fender%').all # sqlite3 for development # out for deployment
  end
  
  def gibson
      brand = params[:brand]
    #@items = Item.where("brand ILIKE ?", "%gibson%").all 
      @items = Item.where("brand like ?", "%gibson%").all # sqlite3 for development # out for deployment
  end
  
  def taylor
      brand = params[:brand]
     #@items = Item.where("brand ILIKE ?", "%martin%").all 
      @items = Item.where("brand like ?", "%martin%").all # sqlite3 for development # out for deployment
  end
  
  def takamine 
      brand = params[:brand]
     #@items = Item.where("brand ILIKE ?", "%takamine%").all
      @items = Item.where("brand like ?", "%takamine%").all  # sqlite3 for development # out for deployment
  end
  
  def martin
     brand = params[:brand]
    #@items = Item.where("brand ILIKE ?", "%taylor%").all
    @items = Item.where("brand like ?", "%taylor%").all # sqlite3 for development # out for deployment
  end

  def yahama
    brand = params[:brand]
     #@items = Item.where("brand ILIKE ?", "%yahama%").all
     @items = Item.where("brand like ?", "%yahama%").all # sqlite3 for development # out for deployment
  end
  
  
  
  
  def category
    catName = params[:title]
    @items = Item.where("category like ? ", catName)
  end


  def help
      current_user.update_attribute :admin, true
  end

  def about
  end
  
  def createOrder
 
   @orders = Order.all
          
  end
  
  def users
   
    @users = User.all
  end
  
  
  
  def upgrade
        @user = User.find_by(id: params[:id])
        @user.update_attribute(:admin, true)
        redirect_to :action => :users
  end
    
    def downgrade
         @user = User.find_by(id: params[:id])
         @user.update_attribute(:admin, false)
         redirect_to :action => :users
    end   

  
  def paid
    # redirect_to "/cart/clear"
    flash[:notice] = 'Transaction Complete'
    @order = Order.last
    @order.update_attribute(:status , "Paid by User: #{current_user.email}")
    #"Paid by User:#{current_user.id} #{current_user.name} #{current_user.surname}")
    session[:cart] = nil
    
    @orders = Order.all
    @orderitems = Orderitem.all
    @items = Item.all
    
  end


end
