module SessionsHelper
    # Log in the given user.
    def log_in(user)
        session[:user_id] = user.id
        # []　→　配列
        #sessionの中に配列を入れる
        #これでloginできる
        
    end
   
   
        #②　for rememberボックス　　トークンTO Cookies
    # remember a user in a persistent session
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
    

        
    # Return the current logged-in user (if any).
    # already session in or not
    
    # 自分か、自分じゃないかの条件分岐をさせたいから
    # 会員証
    # SESSION持ってる　= loginしてる　=　current_user持ってる。
    # SESSION持ってない　= loginしてない　=　current_user持ってない。
    
    def current_user
        
        if(user_id = session[:user_id])
         #user_id にsessionがあるか？
            
            @current_user ||= User.find_by(id: user_id)
            #前提がTRUE
            #無駄にDBにアクセスしないようにするため
            # @current_user - ログインしてるユーザーの情報(今入れた！)
            
            
        elsif (user_id = cookies.signed[:user_id])
         #user_id にsessionがあるなし関係なく(elsif)
         #user_id にcookiesがあるか？(チェックしてるか)
         
            user = User.find_by(id: user_id)
            # 左に、引数を入れれる
            
            if user && user.authenticated?(cookies[:remember_token])
            
            #check
            #if user && user.authenticated?(:remember, cookies[:remember_token])        
                
            #  "user.authenticated?(cookies[:remember_token])"
            #   =　cookies[:remember_token]は、 DBの中にある暗号化されたtokenと同じか？をcheck(同じならTRUE)
            #   methodの場所　ー　model user.rb
                
                
                log_in user
                @current_user = user
                #クッキーからの、ユーザーの情報。
                
                
            end
        end
        
            
        #Comment: 
        #Masa, this causes error
        #You type: session[:use_id]
        #it must be--  session[:user_id]
        #@current_user ||= User.find_by(id: session[:use_id])
        # @current_user ||= User.find_by(id: session[:user_id])
        
        
    end
    
    # Return true if the user is logged in, false otherwise.
    #already session in or not(for session)
    def logged_in?
        !current_user.nil?
        #current_userが空じゃないですよね？？
        
    end
    
    
    
    # Forget a persistent session.
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    
    # Logs out the crrent user
    def log_out
        forget(current_user)
        
        session.delete(:user_id)
        # sessionのデータ削除
        
        @current_user = nil
    end
    
    # Returns true if the given user is the current user.
    def current_user?(user)
        user == current_user
    end
    
    
    
    
    
    
    
    #②
    #Redirects to dtored location (or to the default)
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        # default - home page
        
        session.delete(:fowarding_url)
        # 蓄えていた"飛びたかった場所"は飛んだあとはもういらないから削除。
        
    end
    
    
    #①
    # Stores the URL trying to be accessed.
    # 行き先のURLを取得するために使う(GETの時のみ)
    def store_location
        session[:forwarding_url] = request.url if request.get?
        
        # forwarding_url = 予約語(symbol)
        # session[:forwarding_url] = variable (hash) =行き先URL
        
        #  request. = 予約語 = action = 要求 = "function"
        
        # request.url - URLを要求する 
        # request.get? - GETのアクション(HTTP verbs)を要求したか確認

    end
    
    
    
end