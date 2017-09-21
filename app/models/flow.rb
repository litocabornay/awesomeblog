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
  


  
  def sum_of_price
    before_price + price
  end
  
  
end
