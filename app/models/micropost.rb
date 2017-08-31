class Micropost < ActiveRecord::Base
  belongs_to :user
  # user:references で自動生成
  
  default_scope -> { order(created_at: :desc) }
  # scope - 絞り込み
  # asc - ascending A-Z previousがはじめ
  # desc - descending Z-A Latestがはじめ
  
  mount_uploader :picture, PictureUploader
  # 画像アップのための準備
  
  validates :user_id, presence: true
  # if user_id empty , we can't connect
  # コネクティングのためのvalidates
  
  validates :content, presence: true, length: { maximum: 140 }
  
  validate  :picture_size
  #画像のサイズについての制限
  #以下、private内のmethodを実行してる

  private
   # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
        #エラーに１つ加える
      end
    end
  # 画像が重いとエラーだす。

end
