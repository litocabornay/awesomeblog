class Flow < ActiveRecord::Base
  # belongs_to :user
  # # user:references で自動生成
  
    
  # default_scope -> { order(created_at: :desc) }
  # # scope - 絞り込み
  # # asc - ascending A-Z previousがはじめ
  # # desc - descending Z-A Latestがはじめ
  
  # validates :user_id, presence: true
  # # if user_id empty , we can't connect
  # # コネクティングのためのvalidates
  

  # validates :company, presence: true, length:{ maximum: 20 }
  # validates :before_price, presence: true, length:{ maximum: 10 }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :year_date, presence: true, length:{ maximum: 10 }
  # validates :month_date, presence: true, length:{ maximum: 10 }
  # validates :day_date, presence: true, length:{ maximum: 10 }
  
  # validates :price, presence: true, length:{ maximum: 10 }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :after_price, presence: true, length:{ maximum: 10 }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :staff, presence: true, length:{ maximum: 10 }
  # validates :memo, length:{ maximum: 100 }
  
  # validates :content, presence: true, length:{ maximum: 20 }
  # validates :pass_company, presence: true, length:{ maximum: 20 }
  # validates :recieve_company, presence: true, length:{ maximum: 20 }

  
  def sum_of_price
    before_price + price
  end
  
  
end
