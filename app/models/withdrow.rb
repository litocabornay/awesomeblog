class Withdrow < ActiveRecord::Base
 
  validates :user_id, presence: true, length:{ maximum: 10 }, format: { with: /\A[a-z0-9]+\z/i }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  validates :price, presence: true, length:{ maximum: 10 }, format: { with: /\A[a-z0-9]+\z/i }
  validates :status, presence: true, length:{ maximum: 10 }

    
 
  scope :one, -> { where status: 'yet' }
 
end
