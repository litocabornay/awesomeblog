class Safe < ActiveRecord::Base
include ActionView::Helpers


  def self.to_csv
    CSV.generate do |csv|
      # column_namesはカラム名を配列で返す
      # 例: ["id", "name", "price", "released_on", ...]
      csv << column_names
      all.each do |safe|
        # attributes はカラム名と値のハッシュを返す
        # 例: {"id"=>1, "name"=>"レコーダー", "price"=>3000, ... }
        # valudes_at はハッシュから引数で指定したキーに対応する値を取り出し、配列にして返す
        # 下の行は最終的に column_namesで指定したvalue値の配列を返す
        csv << safe.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.csv_column_names
    ["ID", "機種", "種別", "機器番号", "入庫日時", "出庫日時", "機種名", "倉庫", "入庫登録者", "出庫登録者", "入庫先", "出庫先", "価格", "備考", "
  画像", "状況", "P-sensor"]
  end

  def csv_column_values
    [id, machine, type_machine, created_at, updated_at, name, place, staff, staff_two, from, to, price_from, remarks, photo, status, sensor]
  end
  

  mount_uploader :photo, PictureUploader
  # 画像アップのための準備

  
  validate  :photo
  #画像のサイズについての制限
  #以下、private内のmethodを実行してる

  private
   # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:photo, "5MB以下の画像にしてください。")
        #エラーに１つ加える
      end
    end
  # 画像が重いとエラーだす。
  
  
  # validates :machine, presence: true, length:{ maximum: 10 }
  
  
  # validates :type_machine, presence: true, length:{ maximum: 10 }
  
  # validates :number, presence: true, length:{ maximum: 50 }
  # validates :name, presence: true, length:{ maximum: 100 }
  # validates :from, presence: true, length:{ maximum: 50 }
  # validates :price_from, presence: true, length:{ maximum: 10 } 
  
  
  # validates :status, presence: true, length:{ maximum: 10 }
  # validates :seller_id, presence: true, length:{ maximum: 10 }, format: { with: /\A[a-z0-9]+\z/i }

  # validates :date_of_arrive, presence: true, length:{ maximum: 20 }
  # validates :confirm_price, presence: true, length:{ maximum: 10 }, format: { with: /\A[a-z0-9]+\z/i }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :confirm_number, presence: true, length:{ maximum: 10 }, format: { with: /\A[a-z0-9]+\z/i }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :limit_of_inspection, presence: true, length:{ maximum: 20 }
  





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


  #ユーザー名による絞り込み 
  scope :get_by_name, ->(name) {
  where("name like ?", "%#{name}%")
  }
  
  #ユーザー名による絞り込み 
  scope :get_by_maker, ->(maker) {
  where("maker like ?", "%#{maker}%")
  }
  
  
  # #メーカーによる絞り込み
  # scope :get_by_maker, ->(maker) {
  # where(maker: maker)
  # }
  
end
