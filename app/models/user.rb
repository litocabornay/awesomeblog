class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  #これによって、初めて2つのDBがコネクト
  #親が死んだら、子も死ぬ設定。
  
  
  
  #フォローする設定ーーーーーーー
  #ーーーーーーーーーーーーーーー
  has_many :active_relationships,   
  #ここに本来ならモデルの名前が入る
  #しかし、このケースでは、モデルではなくactive_relationships。
  #classの設定で代わりにモデルと繋げている

  # Userは、active_relationships(イマジナリーテーブル)を持つことができる。という意味。
  # active_relationshipsは今作った。
  # has_manyは持つことができる。
  # このファイルがUserの設定というとこがミソ。
  
                                  class_name:  "Relationship",
                                  #テーブルRelationshipと繋げてる。それだけ
                                  foreign_key: "follower_id",
                                  #繋がってるテーブルRelationshipの、棚"follower_id"と繋げてる。それだけ
                                  #結論　→　follower_id(フォローしてる人一覧)と結びつける
                                  
                                  dependent:   :destroy
                                  #親が死んだら、子も死ぬ設定。
                                  
  # 結論、active_relationshipsは、「だれフォローしてる(全員)(IDのみ)」っていうだけ
                                  
  has_many :following, through: :active_relationships, source: :followed
  # following(フォローしてる)もイマジナリーテーブル
  
  # Uesrは、followingを持てる。
  # followingは情報が１つだけ。(active_relationshipsはたくさん情報が入ってる)

  #through　-　あるテーブルから情報を引っ張ってくる
  #source: :followed　- active_relationshipsのfollowed(フォローされてる人一覧)の情報とむすびつく
  #ターゲットはどこにする？
  #(このケースでは、sourceは、railsが自動で探し出してくれるから省略化。)
  
  #class_nameの中のforeign_key　っていう概念と、
  #throughの中のsource　っていう概念と、
  #はほぼ同じ感じ。
  
  # 結論、followingは、「だれフォローしてる(特定の１人)(名前やE-mailなどの情報)」っていうだけ
  
  
  
  
  
  
  
  #フォローされる設定ーーーーーーー
  #ーーーーーーーーーーーーーーー
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  # 結論、passive_relationships、「だれにフォローされてる(全員)(IDのみ)」っていうだけ  
  # 結論、followersは、「だれフォローされてる(特定の１人)(名前やE-mailなどの情報)」っていうだけ
  
  #following(してる)とfollowers(されてる)は逆の意味(ややこしいが)
  
  
  
  
  
  

  
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
  
  
  
  # before
  # validates :password, presence: true, length: { minimum: 6 
  # after
  validates :password, presence: true, length: { minimum: 6 } ,allow_nil: true
  # presence: true　があるため、新規ユーザーはemptyではNG
  # ただし、既存ユーザーはすでにデータが存在するため、
  # allow_nil: true　でemptyでもOK。
  
  
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

  
  #③　for rememberボックス　　①②が同じものか確認(再ログイン時)
  # Return true if the given token matches the digest.
  def authenticated?(remember_token)
  #  【authenticated?(remember_token)】という名前のaction
  #  真偽を確認するmethod名(action名)には ? が必須
    
    return false if remember_digest.nil?
    #　remember_digest(トークンを暗号化)がない前提　←空ならfalse
    
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
    #　remember_digest(トークンを暗号化)　と、remember_token(暗号化する前のトークン)が、、
    #　同じものかどうかを　BCrypt::Password　を使って確認
    #　この動作をauthenticatedと呼ぶ
    
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
  
  
  

  
  
  
  
  def feed
    
     following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    
     Micropost.where("user_id IN (#{following_ids})
     OR user_id = :user_id", user_id: id)
    #OR - フォローしてるユーザーのみ出力するニュースフィードにしてる
    
    
    # before
    # Micropost.where("user_id = :user_id", user_id: id)
    # user_id = :user_id, user_id: id
    # ユーザーテーブルのID　＝：ただコネクトのため, ただコネクトのため:　マイクロポストテーブルのID
    
    
  end
  
  #ニュースフィードに表示する情報を引っ張る。
  #見つけるだけ　←フィードをアウトプットするための
  #特定のユーザーのマイクロポストを全部見るける
  
  
  
  # # Follows a user.
  # def follow(other_user)
  #   following << other_user
  #   # pseudocode　-本番ではないコード
    
  #   # following　はイマジナリーテーブル
  # end

  # # Unfollows a user.
  # def unfollow(other_user)
  #   following.delete(other_user)
  # end

  # # Returns true if the current user is following the other user.
  # def following?(other_user)
  #   following.include?(other_user)
  # end



  #TRY 2
  
  
  #ここはuserのコントローラーなので、ユーザーの情報に関するアクションを作ってる
  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
    #createはsave(newとcreate両方のイメージ)
    #followed_id: と、other_user.id は、変更すべき２つの棚
    #フォローした人、された人
    #この２つを作るのがfollow()
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
    #探して、deleteする　→unfollow()
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
    #画面の表示を変えるための条件分岐
    #following.include?　→followingに情報入ってる？？
  end

  
end
