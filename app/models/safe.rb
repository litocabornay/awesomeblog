class Safe < ActiveRecord::Base
include ActionView::Helpers



  
  

  # validates :status, presence: true, length:{ maximum: 10 }
  # validates :seller_id, presence: true, length:{ maximum: 10 }, format: { with: /\A[a-z0-9]+\z/i }

  # validates :date_of_arrive, presence: true, length:{ maximum: 20 }
  # validates :confirm_price, presence: true, length:{ maximum: 10 }, format: { with: /\A[a-z0-9]+\z/i }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :confirm_number, presence: true, length:{ maximum: 10 }, format: { with: /\A[a-z0-9]+\z/i }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :limit_of_inspection, presence: true, length:{ maximum: 20 }
  
  # validates :date_of_arrive, :presence => {:message => '到着日時を入力してください'}
  # validates :confirm_price, :presence => {:message => '価格を入力してください'}
  # validates :confirm_number, :presence => {:message => '数量を入力してください'}
  # validates :limit_of_inspection, :presence => {:message => '納期を入力してください'}




# module Current
#   thread_mattr_accessor :user
# end

# def self.current_user
# ApplicationController.helpers.current_user
# end


  # def self.sumprice  
  #   sum(:confirm_price)
  # end
  
  # def self.whereprice  
  #   where("seller_id == current_user.id")
  # end
  
  
  # # observe :post
  #   # belongs_to :user
    
  # # def after_create(record)
  # #  ## here im using background job sidekiq
  # #  InsertActivities.perform_async("#{User.current.id}") 
  # # end
  
  
  # # belongs_to :buyer, class_name: "User"
  # # belongs_to :seller, class_name: "User"

  # validates :buyer_id, presence: true, length:{ maximum: 10 }
  # validates :seller_id, presence: true, length:{ maximum: 10 }
  
  

  # scope :one, -> { where status: 'one' }
  # scope :two, -> { where status: 'two' }
  # scope :three, -> { where status: 'three' }
  # scope :returner, -> { where status: 'return' }
  
  # scope :finish, -> { where status: 'end' }
  # scope :finish_returner, -> { where status: 'return_end' }


  # scope :seller_correct_user, -> { where(buyer_id: :user_id) }
  # scope :buyer_correct_user, -> { where(seller_id: :user_id) }

  
end
