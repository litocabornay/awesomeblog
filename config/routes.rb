Rails.application.routes.draw do

get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
#signup

get '/login', to:'sessions#new'
post '/login', to:'sessions#create'
delete '/logout', to:'sessions#destroy'


# get 'inquiry' => 'inquiry#index'              # 入力画面
# post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
# post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
# # お問い合わせ
 
root 'static_pages#home'
# post "/" => 'static_pages#home'
# get '/slot', to: 'static_pages#slot', as:'slot'
# post "/slot" => 'static_pages#slot'
# get '/extra', to: 'static_pages#extra', as:'extra'
# post "/extra" => 'static_pages#extra'
# # SELLS  の INDEX
# #コントローラーは、statics

# get '/own', to: 'static_pages#own', as:'own'
# get '/own_slot', to: 'static_pages#own_slot', as:'own_slot'
# get '/own_extra', to: 'static_pages#own_extra', as:'own_extra'
# # SELLS  の OWNのみ INDEX
# #コントローラーは、statics

# get '/own_finish', to: 'static_pages#own_finish', as:'own_finish'
# get '/own_slot_finish', to: 'static_pages#own_slot_finish', as:'own_slot_finish'
# get '/own_extra_finish', to: 'static_pages#own_extra_finish', as:'own_extra_finish'
# # SELLS  の OWNのみ INDEX
# #コントローラーは、statics


# get '/sells/new', to: 'sells#new', as:'new_sells'
# post '/sells', to: 'sells#create'
# #sells_pathに飛ぶから更新できる。
# get '/sells/slot', to: 'sells#slot', as:'slot_sells'
# get '/sells/extra', to: 'sells#extra', as:'extra_sells'
# # SELLS の NEW (+create)

# get '/sells/:id/show', to: 'sells#show', as:'show_sells'
# # get '/sells/:id/show_slot/', to: 'sells#show_slot', as:'show_slot_sells'
# # get '/sells/:id/show_extra/', to: 'sells#show_extra', as:'show_extra_sells'
# # SELLS の SHOW

# get '/sells/:id/edit', to: 'sells#edit', as:'edit_sells'
# patch '/sells', to:'sells#update'
# put '/sells', to:'sells#update'
# get '/sells/:id/edit_slot/', to: 'sells#edit_slot', as:'edit_slot_sells'
# get '/sells/:id/edit_extra/', to: 'sells#edit_extra', as:'edit_extra_sells'
# # SELLS の EDIT

# post '/back' => "sells#back"
# get '/back', to: 'sells#back', as:'back_sells'
# # 前のページに戻るアクション

# get '/analyze', to: 'static_pages#analyze', as:'analyze_static_pages'
# # アナライズ


# get '/bss/:id/', to:'static_pages#edit', as:'edit'
# get '/bss/', to:'static_pages#index', as:'index'
# # admin:入金アクション

resources :account_activations, only: [:edit]
resources :password_resets,     only: [:new, :create, :edit, :update]
#パスワード再設定
 
# resources :users do
#     member do
#       get :following, :followers
#     end
#     member do
#       get :buyer, :seller, :buyer_finish, :seller_finish
#     end
#   end
# get '/users/:id/edit', to:'users#edit_noflow', as:'edit_noflow_users'
# patch '/users/:id/edit', to:'users#update_noflow'
# put '/users/:id/edit', to:'users#update_noflow'


# resources :static_pages, only: [:edit]

# resources :sells , only: [:index]

# resources :withdrows , only: [:index, :new, :create, :edit, :update]

resources :safes , only: [:index, :new, :create, :edit]

# get '/safes/safe', to: 'safes#safe', as:'safe'

get 'safe_before' => 'safes#safe'  
get 'safe_after' => 'safes#after'  
get 'zaiko' => 'safes#index2'  

patch '/safes/:id', to:'safes#editbot'
put '/safes/:id', to:'safes#editbot'

# # patch '/safes/:id', to:'safes#update'
# # put '/safes/:id', to:'safes#update'
# # form_for(@safe) & @safe = Safe.find(params[:id]) = showページ = /safes/:id

# patch '/safes/:id/rejection', to:'safes#rejection', as:'rejection_safes'
# put '/safes/:id/rejection', to:'safes#rejection'
# # link_to rejection_safes = /safes/:id/rejection

# patch '/safes/:id/returnback', to:'safes#returnback', as:'returnback_safes'
# put '/safes/:id/returnback', to:'safes#returnback'


# resources :flows, only: [:index, :new, :create]
# get '/flows/own', to: 'flows#own', as:'own_flows'




# get '/★/:id/edit', to:'★#edit', as:'edit_★(s)'
# patch '/★/:id', to:'★#update'
# put '/★/:id', to:'★#update'


end