Rails.application.routes.draw do

get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
#userでsignupというアドレスを作る

get '/login', to:'sessions#new'
post '/login', to:'sessions#create'
delete '/logout', to:'sessions#destroy'
#sessionsでlogin、logoutというアドレスを作る

root 'static_pages#home'
get '/slot', to: 'static_pages#slot', as:'slot'
get '/extra', to: 'static_pages#extra', as:'extra'

get 'sells/slot', to: 'sells#slot', as:'slot_sells'
get 'sells/extra', to: 'sells#extra', as:'extra_sells'


get '/sells/:id/show', to: 'sells#show', as:'show'
get '/sells/show_slot/:id/', to: 'sells#show_slot', as:'show_slot'
get '/sells/show_extra/:id/', to: 'sells#show_extra', as:'show_extra'




get '/sells/:id/make_safe', to:'sells#make_safe', as:'edit_sells'

# get 'users/:id/show_safe', to:'users#show_safe', as:'show'

get '/selluser/:id/', to:'sellusers#show', as:'sellshow'

get '/money', to:'static_pages#help', as:'help'

get '/bss/:id/', to:'static_pages#edit', as:'edit'
get '/bss/', to:'static_pages#index', as:'index'

get '/about/:id/', to: 'static_pages#about' ,as:'about'


get 'inquiry' => 'inquiry#index'              # 入力画面
post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
  
  
  
get 'users/:id/moneyedit', to: 'users#moneyedit' ,as:'moneyedit'

# get 'pay_relationship/create'
# get 'pay_relationship/destroy'
# get '/suggestion/:id/', to: 'sells#home' ,as:'home'
#get '/contact', to: 'static_pages#contact' ,as:'contact'
#static_pagesはresourcesがないから、１つずつ設定しないといけない
# controller :portal do
#   get "index" => :index
#   get "more"  => :more
# end




get '/', to:'sells#new'
post '/', to:'sells#create'
# delete '/', to:'sells#destroy'

get '/admin/money', to:'bank#users'



   

resources :users do
  
    member do
      get :following, :followers
    end
    
    member do
      get :buyer, :seller, :finish
    end
    
  end
#”フォロー”に関する各、フォロワー・被フォロワーの個別ページに飛べる設定
#この設定で、memberメソッドを使うとユーザーidが含まれているURLを扱うようになる
#memberは条件分岐するための予約ワード

# memberの能力
# URLは２つ、ファイルは１つ
# ①コントローラーで飛ぶURLと同じ名前、memberのgetと同じ名前、のmethodを書く、
# ②情報を挙列させると、カスタムフィールドのように、部分的に別の表示をさせることができる


# get :following, :followers - user/followingとuser/followers というファイルを作る

resources :sells 

resources :safes 
# do
    
#     member do
#       get :one, :two, :three, :four, :five
#     end
    
#   end
  
  
  
# resources :banks

resources :bank_historys

resources :static_pages

resources :flows



resources :makers

resources :microposts, only: [:create, :destroy]

resources :relationships, only: [:create, :destroy]

resources :account_activations, only: [:edit]

resources :password_resets,     only: [:new, :create, :edit, :update]

  namespace :admin do
  # get '/admin/sells'
  # get '/admin/safes'
  # get '/admin/banks'
  # get '/admin/static_pages'
  
  root 'static_pages#home'
  
  resources :users
  resources :sells
  resources :banks
  
  resources :deposits, only: [:index, :edit, :update]
  # get '/deposits', to:'deposits#index'
  # get '/deposits/:id/edit', to:'deposits#edit', as:'edit_deposits'
  # patch '/deposits/:id', to:'deposits#update'
  # put '/deposits/:id', to:'deposits#update'
  end

  namespace :bank do
  # root 'users#index'
  #resources :users
  get '/users/:id/edit', to:'users#edit', as:'edit_users'
  end





# ★ = plural
# get '/★', to:'★#index'
# /★のURLにアクセスしたら、
#controllerの★#indexを作動させる
#２つの★が同一な時のみto:の省略化。

# get '/★/new', to:'★#new', as:'new_ ★(s)' 
# post '/★', to:'★#create'
# get '/★/:id', to:'★#show', as:'user'
# get '/★/:id/edit', to:'★#edit', as:'edit_★(s)'
# patch '/★/:id', to:'★#update'
# put '/★/:id', to:'★#update'
# delete '/★/:id', to:'★#destroy'

#↓add original action
# resources :★ do
#    member do
#     post '★original★'
#    end
#  end


#get 'sessions/new'
end