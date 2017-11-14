class DetailsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :new, :create, :destroy]
  before_action :yet_detail, only: [:new, :create]
  before_action :done_detail, only: [:edit, :update]
  # before_action :admin_user, only: [:index, :edit, :update, :new, :create, :destroy]
  
   
  def index
    @details =Detail.paginate(page: params[:page]) 
  end
  
  # def show
  #   render 'edit'
  # end

  def new
    @detail = Detail.new
  end
  
  def edit
    @detail = Detail.find(params[:id])
  end
  
  def create
    #render plain: params[*topic] .inspect
    @detail = current_user.details.build(detail_params)
    if @detail.save
      flash[:success] = "設定されました。"
      render 'edit'
    else
      #sessionヘルパーで定義したやつ
      flash[:danger] = "未入力項目があります。"
      render 'new'
    end
  end
  
  def update
    @detail = Detail.find(params[:id])
    if @detail.update(detail_params) #通常、セキュリティ入れる
      flash[:success] = "設定されました。"
      redirect_to edit_detail_path(params[:id])
    else
      flash[:danger] = "未入力項目があります。"
      redirect_to edit_detail_path(params[:id])
    end
  end
  
  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy
      redirect_to root_url
  end


  private

  def detail_params
    params.require(:detail).permit(:company_name, :company_name_sounds, :company_president, :company_president_sound, :company_post_number, :company_place, :company_place_detail, :company_call_number, :company_fax_number, :company_branch, :company_type, :company_union, :company_reception, :company_reception_sound, :company_position, :company_post_number_contact, :company_place_contact, :company_call_number_contact, :company_call_number_contact_name_1, :company_call_number_contact_tel_1, :company_call_number_contact_name_2, :company_call_number_contact_tel_2, :company_call_number_contact_name_3, :company_call_number_contact_tel_3, :company_call_number_contact_name_4, :company_call_number_contact_tel_4, :company_call_number_contact_name_5, :company_call_number_contact_tel_5, :company_call_number_contact_name_6, :company_call_number_contact_tel_6, :company_call_time_from_1, :company_call_time_from_2, :company_call_time_to_1, :company_call_time_to_2, :company_fax_number_contact, :company_call_number_emergency, :company_url, :company_mail_address, :company_place_detail_contact, :company_pr)
  end
  
  # def correct_user
  #   @user = User.find(params[:id])
  #   redirect_to(root_url) unless current_user?(@user)
  # end
  
  # def done_detail
  #   @detail = current_detail.details.find_by(id:params[:id])
  #   render 'new' if @detail.nil?
  # end
  
  def done_detail
    # @detail = Detail.find(params[:id])
    # redirect_to(root_url) unless current_detail?(@detail)
  end
  
  def yet_detail
    # @detail = Detail.find(params[:id])
    # redirect_to(root_url) unless current_detail?(@detail)
  end
  
  # def yet_detail
  #   @detail = current_detail.details.find_by(id:params[:id])
  #   render 'edit' if @detail.true?
  # end
  
  # def admin_user
  #   redirect_to(root_url) unless current_user.admin?
  # end
  


  


end
