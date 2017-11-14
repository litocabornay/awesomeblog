class FlowsController < ApplicationController
  before_action :logged_in_user, only:  [:destroy, :help, :edit, :index, :new, :create]
  # before_action :correct_user, only:  [:destroy, :help, :edit, :index, :new, :create]
  before_action :admin_user, only: [:destroy, :help, :edit, :index, :new, :create]

def index
    @flows = Flow.paginate(page: params[:page]) 
end
def own
    @flows = Flow.paginate(page: params[:page]) 

end


def new
    @flow = Flow.new
end

def create
    @user = User.find(params[:id])
  
    @flow = Flow.build(flow_params)

     if @flow.save
       flash[:success] = "フロー"
       redirect_to root_url
     else
       @flow = []
       flash[:danger] = "未入力項目があります。"
       redirect_to new_sell_path
     end
end







  private
  
  
   # def correct_user
   #   @sell = current_user.sells.find_by(id:params[:id])
   #   redirect_to root_url if @sell.nil?
   # end
 

   def flow_params
      params.require(:flow).permit(:content, :before_price, :year_date, :month_date, :day_date, :price, :after_price, :staff, :memo, :pass_company, :recieve_company, :company)
   end
  
  # def money_update
    
  # end



  
  
end
