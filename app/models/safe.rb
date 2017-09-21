class Safe < ActiveRecord::Base
include ActionView::Helpers


# module Current
#   thread_mattr_accessor :user
# end

# def self.current_user
# ApplicationController.helpers.current_user
# end
  
  
  # observe :post
    # belongs_to :user
    
  # def after_create(record)
  #  ## here im using background job sidekiq
  #  InsertActivities.perform_async("#{User.current.id}") 
  # end
  
  
  # belongs_to :buyer, class_name: "User"
  # belongs_to :seller, class_name: "User"

  validates :buyer_id, presence: true
  validates :seller_id, presence: true
  
  

  scope :one, -> { where status: 'one' }
  scope :two, -> { where status: 'two' }
  scope :three, -> { where status: 'three' }
  scope :returner, -> { where status: 'return' }
  
  scope :end, -> { where status: 'end' }
  scope :returner_end, -> { where status: 'return_end' }


  scope :seller_correct_user, -> { where(buyer_id: :user_id) }
  scope :buyer_correct_user, -> { where(seller_id: :user_id) }

  
end
