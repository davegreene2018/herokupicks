class StaticPagesController < ApplicationController
  def home
    @orders = Order.all
    @orderitems = Orderitem.all
    @items = Item.all
    
    @categories = Category.all
  end
  
  def fender
       @items = Item.where("brand like ? ", fender)
  end
  
  def gibson
      
  end
  
  def taylor
      
  end
  
  def takamine 
      
  end
  
  def martin
      
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
  
  
  
  def upgrade_admin
        @user.update_attribute(:adminrole, true)
        redirect_to :action => :admin_users
  end
    
    def downgrade_admin
       @user.update_attribute(:adminrole, false)
         redirect_to :action => :admin_users
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
