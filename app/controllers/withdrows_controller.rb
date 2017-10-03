class WithdrowsController < ApplicationController
 
def index
    @withdrows = Withdrow.one
end

def new
    @withdrow = Withdrow.new
    @user = current_user
    @content = "サイト内バンクからリアル銀行への出金"
    @flow = Flow.new

end

def create
    @withdrow = Withdrow.new(withdrow_params)
    @flow = Flow.new(flow_params)
    @user = User.find(current_user)

    @money_before = @user.money
    @withdrow_money = @withdrow.price
    @money_after = @money_before - @withdrow_money
    
    if @withdrow.save
     @user.update(:money => @money_after)

      @flow.save
      @money1 = @flow.price
      #@flow.priceはdefaultを0にしておかないとエラー
      
      @flow.update(:price => @withdrow_money * -1)
      @flow.update(:before_price => @money_before)
      @flow.update(:after_price => @money_after)
      @user.update(:money => @money_after)


     redirect_to "/withdrows/new"
      flash[:success] = "送信されました。"
    else
      render 'edit'
      flash[:danger] = "未入力項目があります。"
    end
end
 

  
def edit
    @withdrow = Withdrow.find(params[:id])
end


  def update
    @withdrow = Withdrow.find(params[:id])

    
    
    if @withdrow.update(withdrow_params2) 
     redirect_to "/withdrows/"
    else
      render 'edit'
    end
  end
  
  
  
  
   private


   def flow_params
      params.require(:flow).permit(:content, :before_price, :year_date, :month_date, :day_date, :price, :after_price, :staff, :memo, :pass_company, :recieve_company, :company)
   end 

   def withdrow_params
      params.require(:withdrow).permit(:user_id, :message, :price, :status)
   end 

   def withdrow_params2
      params.require(:withdrow).permit(:status)
   end 
 
   def user_params
      params.require(:user).permit(:money)
   end 
 
 
end






