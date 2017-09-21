class Relationship < ActiveRecord::Base
  
  belongs_to :follower, class_name: "User"
  #belongs_to :follower - migrationのフォローした人一覧
  belongs_to :followed, class_name: "User"
  #belongs_to :followed - migrationのフォローされた人一覧
  
  #この２つは、ただUserテーブルと繋げるためだけのもの。
  
  
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  #フォローする方もされる方も存在してないといけない
  #基本的にvalidationってVC-MVCのMVCのMに必ず１つずつある
  
end
