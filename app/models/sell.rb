class Sell < ActiveRecord::Base
  belongs_to :user
  # belongs_to :detail
#—————
#以下はsellのためです。—————
#—————
  # has_many :sells
  #これによって、初めて2つのDBがコネクト
#—————
  
  # user:references で自動生成
#————— 
  # default_scope -> { order(created_at: :desc) }
#————— 




  

  #validates :user_id, presence: true
  # if user_id empty , we can't connect
  # コネクティングのためのvalidates
  
  
  validates :name, presence: true, length:{ maximum: 100 }
  validates :maker, length:{ maximum: 50 }
  validates :number, presence: true, length:{ maximum: 10 }, format: { with: /\A[a-z0-9]+\z/i }
  validates :status, presence: true, length:{ maximum: 10 }
  validates :place, length:{ maximum: 10 }
  validates :price, presence: true, length:{ maximum: 10 }, format: { with: /\A[a-z0-9]+\z/i }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :removal_date, length:{ maximum: 10 }
  validates :remnant, length:{ maximum: 10 }
  validates :stage, length:{ maximum: 10 }
  validates :condition, length:{ maximum: 10 }
  validates :remarks, presence: true, length:{ maximum: 10 }
  validates :type_machine, length:{ maximum: 10 }
  validates :cylinder, length:{ maximum: 10 }
  validates :content_type, length:{ maximum: 10 }
  validates :user_id, length:{ maximum: 10 }, format: { with: /\A[a-z0-9]+\z/i }
  self.per_page = 20
 
 
 
 
 
 
 
 
  
  
  # enum makers:
  # { 
  # 愛喜: " 愛喜", 
  # アビリット: " アビリット", 
  # アムテックス: " アムテックス", 
  # エース電研: " エース電研", 
  # Aーgon: " Aーgon", 
  # ＥＸＣＩＴＥ: " ＥＸＣＩＴＥ", 
  # 奥村: " 奥村", 
  # オッケー: " オッケー", 
  # オリンピア: " オリンピア", 
  # 京楽: " 京楽", 
  # 銀座: " 銀座", 
  # サミー: " サミー", 
  # 三共: " 三共", 
  # サンスリー: " サンスリー", 
  # サンケイR＆D: " サンケイR＆D", 
  # 三洋: " 三洋", 
  # ジェイビー: " ジェイビー", 
  # 大一: " 大一", 
  # 大都技研: " 大都技研", 
  # タイヨーエレック: " タイヨーエレック", 
  # 高尾: " 高尾", 
  # 高砂電器産業: " 高砂電器産業", 
  # 竹屋: " 竹屋", 
  # 大和工業: " 大和工業", 
  # 大和製作所: " 大和製作所", 
  # トビー: " トビー", 
  # 豊丸: " 豊丸", 
  # 七匠: " 七匠", 
  # 西陣: " 西陣", 
  # ニューギン: " ニューギン", 
  # PーCUBE: " PーCUBE", 
  # ビスティ: " ビスティ", 
  # 藤商事: " 藤商事", 
  # 平和: " 平和", 
  # ベルコ: " ベルコ", 
  # まさむら: " まさむら", 
  # マルホン: " マルホン", 
  # ミズホ: " ミズホ", 
  # メーシー: " メーシー", 
  # メーシー販売: " メーシー販売", 
  # その他: " その他" 
  # }
  

  
  
  # #ユーザー名による絞り込み 
  # scope :get_by_name, ->(name) {
  # where("name like ?", "%#{name}%")
  # }
  
  
  # #メーカーによる絞り込み
  # scope :get_by_maker, ->(maker) {
  # where(maker: maker)
  # }


  
end