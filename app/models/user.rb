#class User < ApplicationRecord
class User < ActiveRecord::Base
 
# before_update :calculate_profit
 
# def self.current
#     Thread.current[:user]
# end

# def self.current=(user)
#     Thread.current[:user] = user
# end


# validates_acceptance_of :confirming
#   after_validation :check_confirming

#   def check_confirming
#     errors.delete(:confirming)
#     self.confirming = errors.empty? ? '1' : ''
#   end


  # def calculate_profit
  #   self.money ||= self.money + self.reccent_deposit

  # end
  
  
  # def self.sumprice  
  #   sum(:money)
  #   #User.sumでもかまいません
  #   #カラム名(フィールド名)は大文字使ってもいいですが、普通小文字の方がよいです
  # end
  

  # def self.sumyetprice  
  #   sum(:money_yet)
  #   #User.sumでもかまいません
  #   #カラム名(フィールド名)は大文字使ってもいいですが、普通小文字の方がよいです
  # end
  
  
  
  
#—————
#以下はパスワード再設定のためです。—————
#以下はメール認証のためです。—————
#—————  

  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  #メールアドレス小文字変換
  
  before_create :create_activation_digest
  #一時的なランダム文字列（トークン）を発行

# #—————
# #以下はマイクロポストのためです。—————
# #—————
#   has_many :microposts, dependent: :destroy
#   #これによって、初めて2つのDBがコネクト
#   #親が死んだら、子も死ぬ設定。
# #—————
# #—————
# # #以下はflowのためです。—————
# # #—————
#   has_many :flows
# #   #これによって、初めて2つのDBがコネクト
# #   #親が死んだら、子も死ぬ設定。
# #—————
# #—————
# # #以下はsafeのためです。—————
# # #—————
#   has_many :safes

#   # has_many :buyer, class_name:  "Safe",
#   #                 foreign_key: "buyer_id"
#   # has_many :buying, through: :buyer, source: :buyed
  
#   # has_many :seller, class_name:  "Safe",
#   #                 foreign_key: "seller_id"
#   # has_many :selling, through: :seller, source: :selled
# #—————

# #以下はsellのためです。—————
# #—————
#   has_many :sells, dependent: :destroy
#   #これによって、初めて2つのDBがコネクト
#   #親が死んだら、子も死ぬ設定。
# # #—————
# # #以下はdetailのためです。—————
# # #—————
# #   has_many :details, dependent: :destroy
# #   #これによって、初めて2つのDBがコネクト
# #   #親が死んだら、子も死ぬ設定。
  
# # #—————
# #以下はフォロー/アンフォローのためです。１—————
# #—————

#   #フォローする設定ーーーーーーー
#   #ーーーーーーーーーーーーーーー
#   has_many :active_relationships,   
#   #ここに本来ならモデルの名前が入る
#   #しかし、このケースでは、モデルではなくactive_relationships。
#   #classの設定で代わりにモデルと繋げている

#   # Userは、active_relationships(イマジナリーテーブル)を持つことができる。という意味。
#   # active_relationshipsは今作った。
#   # has_manyは持つことができる。
#   # このファイルがUserの設定というとこがミソ。
  
#                                   class_name:  "Relationship",
#                                   #テーブルRelationshipと繋げてる。それだけ
#                                   foreign_key: "follower_id",
#                                   #繋がってるテーブルRelationshipの、棚"follower_id"と繋げてる。それだけ
#                                   #結論　→　follower_id(フォローしてる人一覧)と結びつける
                                  
#                                   dependent:   :destroy
#                                   #親が死んだら、子も死ぬ設定。
                                  
#   # 結論、active_relationshipsは、「だれフォローしてる(全員)(IDのみ)」っていうだけ
                                  
#   has_many :following, through: :active_relationships, source: :followed
#   # following(フォローしてる)もイマジナリーテーブル
  
#   # Uesrは、followingを持てる。
#   # followingは情報が１つだけ。(active_relationshipsはたくさん情報が入ってる)

#   #through　-　あるテーブルから情報を引っ張ってくる
#   #source: :followed　- active_relationshipsのfollowed(フォローされてる人一覧)の情報とむすびつく
#   #ターゲットはどこにする？
#   #(このケースでは、sourceは、railsが自動で探し出してくれるから省略化。)
  
#   #class_nameの中のforeign_key　っていう概念と、
#   #throughの中のsource　っていう概念と、
#   #はほぼ同じ感じ。
  
#   # 結論、followingは、「だれフォローしてる(特定の１人)(名前やE-mailなどの情報)」っていうだけ
  
  
  
  

  
  
#   #フォローされる設定ーーーーーーー
#   #ーーーーーーーーーーーーーーー
#   has_many :passive_relationships, class_name:  "Relationship",
#                                   foreign_key: "followed_id",
#                                   dependent:   :destroy
#   has_many :followers, through: :passive_relationships, source: :follower

#   # 結論、passive_relationships、「だれにフォローされてる(全員)(IDのみ)」っていうだけ  
#   # 結論、followersは、「だれフォローされてる(特定の１人)(名前やE-mailなどの情報)」っていうだけ
  
#   #following(してる)とfollowers(されてる)は逆の意味(ややこしいが)
  
# #状態を聞くアクションメソッドは、親側(直接MODELに命令を下さない側)で行う
# #まあ、単純にユーザー通しの関係性(リレーション)だから、主語はユーザー。
# #リレーション側じゃなくてユーザー側でやってよ。
# #リレーションはあくまでもhelpだよって事  
  
  
  
# #—————
# #以下はサインアップのためです。—————
# #—————
  
  # サインアップのためのvalidation
  
  before_save { self.email = email.downcase }
  before_save { email.downcase! }
  
  validates :name, presence: true, length:{ maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length:{ maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  has_secure_password
  #gem 'bcrypt','3.1.11'とbundle installが必須

  validates :password, presence: true, length: { minimum: 6 } ,allow_nil: true, format: { with: /\A[a-z0-9]+\z/i }
  # presence: true　があるため、新規ユーザーはemptyではNG
  # ただし、既存ユーザーはすでにデータが存在するため、
  # allow_nil: true　でemptyでもOK。

  
#   validates :company_name, presence: true, length:{ maximum: 20 },uniqueness: true
#   validates :company_name_sounds, presence: true, length:{ maximum: 20 }
#   validates :company_reception, presence: true, length:{ maximum: 20 }
#   validates :company_president, presence: true, length:{ maximum: 20 }
#   validates :company_president_sound, presence: true, length:{ maximum: 20 }
#   validates :company_post_number, presence: true, length:{ maximum: 20 }
#   validates :company_place, presence: true, length:{ maximum: 200 }
#   validates :company_place_detail, presence: true, length:{ maximum: 200 }
#   validates :company_call_number, presence: true, length:{ maximum: 20 }
# # validates :company_fax_number, presence: true
# # validates :company_branch, presence: true
#   validates :company_type, presence: true, length:{ maximum: 20 }
#   validates :company_union, presence: true, length:{ maximum: 20 }
#   validates :company_reception_sound, presence: true, length:{ maximum: 20 }
#   validates :company_position, presence: true, length:{ maximum: 20 }
#   validates :company_post_number_contact, presence: true, length:{ maximum: 20 }
#   validates :company_call_time_from_1, presence: true, length:{ maximum: 5 }
#   validates :company_call_time_from_2, presence: true, length:{ maximum: 5 }
#   validates :company_call_time_to_1, presence: true, length:{ maximum: 5 }
#   validates :company_call_time_to_2, presence: true, length:{ maximum: 5 }
# # validates :company_fax_number_contact, presence: true
#   validates :company_call_number_emergency, presence: true, length:{ maximum: 20 }
# # validates :company_url, presence: true
#   validates :company_mail_address, presence: true, length:{ maximum: 20 }
#   validates :company_place_detail_contact, presence: true, length:{ maximum: 200 }
# # validates :company_pr, presence: true

#   validates :bank_name, presence: true, length:{ maximum: 20 }
#   validates :bank_branch, presence: true, length:{ maximum: 20 }
#   validates :bank_username, presence: true, length:{ maximum: 20 }
#   validates :bank_type, presence: true, length:{ maximum: 20 }
#   validates :bank_number, presence: true, length:{ maximum: 20 },uniqueness: true, format: { with: /\A[a-z0-9]+\z/i }
#   validates :money, length:{ maximum: 20 }, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
# #   # after


  
  
#—————
#以下はリメンバーのためです。—————
#—————

  attr_accessor :remember_token
  #トークン(ランダム)をDBにアクセスせずに自動発行
  
  
  # check botton remember system
  # Returns the hash digest of the given string
  # hushを作る　self.digest(string)　acitionを作る
  #データベースに関するactionは、モデルで作る。
  
  
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  #暗号化のためのコード

  
  end
  
  
  #⓪　for rememberボックス　　token作る
  #Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  # tokenはモデルで作られる
  # User.new_token　- ランダム文字列



  #-----------TRY 1
  #③　for rememberボックス　　①②が同じものか確認(再ログイン時)
  # Return true if the given token matches the digest.
#def authenticated?(remember_token)
  #  【authenticated?(remember_token)】という名前のaction
  #  真偽を確認するmethod名(action名)には ? が必須
  
  #return false if remember_digest.nil?
    #　remember_digest(トークンを暗号化)がない前提　←空ならfalse
  #  BCrypt::Password.new(remember_digest).is_password?(remember_token)
    #　remember_digest(トークンを暗号化)　と、remember_token(暗号化する前のトークン)が、、
    #　同じものかどうかを　BCrypt::Password　を使って確認
    #　この動作をauthenticatedと呼ぶ

  #end
  
  
  
  #-----------TRY 2
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  
  def remember
   self.remember_token = User.new_token
  #
  
  
   #Mispelling Error
   #update_attribute(:remember_digest, User.digset(remember_taken))
   
   update_attribute(:remember_digest, User.digest(remember_token))
   #update_attributeは、:remember_digestに、User.digest(remember_token)を入れる。
   
  end
  
  # Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end  
  
  
  

  
  
# #—————
# #以下はニュースフィードのためです。—————
# #—————  
  
#   def feed
    
#     following_ids = "SELECT followed_id FROM relationships
#                     WHERE follower_id = :user_id"
    
#     Micropost.where("user_id IN (#{following_ids})
#     OR user_id = :user_id", user_id: id)
#     #OR - フォローしてるユーザーのみ出力するニュースフィードにしてる
    
    
#     # before
#     # Micropost.where("user_id = :user_id", user_id: id)
#     # user_id = :user_id, user_id: id
#     # ユーザーテーブルのID　＝：ただコネクトのため, ただコネクトのため:　マイクロポストテーブルのID
    
    
#   end
  
#   #ニュースフィードに表示する情報を引っ張る。
#   #見つけるだけ　←フィードをアウトプットするための
#   #特定のユーザーのマイクロポストを全部見るける
  
  
  
#   def flowfeed
    
#     # following_ids = "SELECT user_id FROM flows
#     #                 WHERE @user = :user_id"
    
#     # Flow.where("user_id IN (#{following_ids})
#     # OR user_id = :user_id", user_id: id)
     
     
#     Flow.where("@user = :user_id", user_id: id)
     
     
#     #OR - フォローしてるユーザーのみ出力するニュースフィードにしてる
  
#     # before
#     # Micropost.where("user_id = :user_id", user_id: id)
#     # user_id = :user_id, user_id: id
#     # ユーザーテーブルのID　＝：ただコネクトのため, ただコネクトのため:　マイクロポストテーブルのID
    
    
#   end
  
  
  
  
# #—————
# #以下はフォロー/アンフォローのためです。２—————
# #—————
  
#   # # Follows a user.
#   # def follow(other_user)
#   #   following << other_user
#   #   # pseudocode　-本番ではないコード
    
#   #   # following　はイマジナリーテーブル
#   # end

#   # # Unfollows a user.
#   # def unfollow(other_user)
#   #   following.delete(other_user)
#   # end

#   # # Returns true if the current user is following the other user.
#   # def following?(other_user)
#   #   following.include?(other_user)
#   # end



#   #TRY 2
  
  
  
  
  
  
#   #ここはuserのコントローラーなので、ユーザーの情報に関するアクションを作ってる
#   # Follows a user.
#   def follow(other_user)
#     active_relationships.create(followed_id: other_user.id)
#     #createはsave(newとcreate両方のイメージ)
#     #followed_id: と、other_user.id は、変更すべき２つの棚
#     #フォローした人、された人
#     #この２つを作るのがfollow()
#   end

#   # Unfollows a user.
#   def unfollow(other_user)
#     active_relationships.find_by(followed_id: other_user.id).destroy
#     #探して、deleteする　→unfollow()
#   end

#   # Returns true if the current user is following the other user.
#   def following?(other_user)
#     following.include?(other_user)
#     #画面の表示を変えるための条件分岐
#     #following.include?　→followingに情報入ってる？？
#   end




#   # def buying(other_user)
#   #   buyer.create(buyer_id: other_user.id)
#   # end




#—————
#以下はメール認証、パスワードリセットのためです。—————
#—————    

#ここらへん全然わからん！！

    # Activates an account.
    #アカウントが有効かのメール確認済んでる？
    
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
  
  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  
  
    # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
    #要求された時刻が、今の２時間前より大きいか？？
  end
  #パスワードリセットの期限
  
  
  
  def self.user(user_id)
    { user: User.find_by_id(user_id),
      flow: Flow.find_by_id(user_id)
    }
  end






  
private



  # def add(x,y)
  # @add = x + y
  # end
    
    
  # Converts email to all lower-case.
  #メールアドレス小文字変換
    def downcase_email
      self.email = email.downcase
    end

  # Creates and assigns the activation token and digest.
  #一時的なランダム文字列（トークン）を発行
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
 
 
end