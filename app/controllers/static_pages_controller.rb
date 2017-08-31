class StaticPagesController < ApplicationController
  def home
    
    if logged_in?
    
      #1
      #@micropost = current_user.microposts.build if logged_in?
    
      #2
      @micropost = current_user.microposts.build
      
      #ページ左側からポストを作るため。build = new
      #newとbuildの違いは、buildは制限がないものを構築する場合。
      
      @feed_items = current_user.feed.paginate(page: params[:page])
      # .feed - オリジナルメソッド　in モデル
      # .paginate - レザブドメソッド - これがループの役割！
    
    end

    
  end

  def about
  end

  def help
  end
  
  def contact
  end
  
end
