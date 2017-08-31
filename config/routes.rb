Rails.application.routes.draw do

root 'static_pages#home'
#トップページの設定

get '/help', to:'static_pages#help', as:'help'
get '/about', to: 'static_pages#about' ,as:'about'
get '/contact', to: 'static_pages#contact' ,as:'contact'
#static_pagesはresourcesがないから、１つずつ設定しないといけない

resources :users do
    member do
      get :following, :followers
    end
  end
#”フォロー”に関する各、フォロワー・被フォロワーの個別ページに飛べる設定
#この設定で、memberメソッドを使うとユーザーidが含まれているURLを扱うようになる
#memberは条件分岐するための予約ワード

# memberの能力
# URLは２つ、ファイルは１つ
# ①コントローラーで飛ぶURLと同じ名前、memberのgetと同じ名前、のmethodを書く、
# ②情報を挙列させると、カスタムポストテンプレートのように、部分的に別の表示をさせることができる


# get :following, :followers - user/followingとuser/followers というファイルを作る



resources :account_activations, only: [:edit]
resources :password_resets,     only: [:new, :create, :edit, :update]
resources :microposts, only: [:create, :destroy]
resources :relationships, only: [:create, :destroy]

get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
#userでsignupというアドレスを作る


get '/login', to:'sessions#new'
post '/login', to:'sessions#create'
delete '/logout', to:'sessions#destroy'
#sessionsでlogin、logoutというアドレスを作る


#get 'sessions/new'
end