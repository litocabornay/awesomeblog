class Add 
 include ActiveModel::Model
 
 
  # Formで使用するプロパティを定義する
  attr_accessor :befo, :afte

  # Validationを定義する
  validates :befo, presence: true
  validates :afte, presence: true
  
end
