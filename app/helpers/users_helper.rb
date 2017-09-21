module UsersHelper

  #Try 2
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  #gravatarコードは、コピペでOK
  
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  
  
    # def form(user)
    #     session[:money] = :money
    #     # []　→　配列
    #     #sessionの中に配列を入れる
    #     #これでloginできる
        
    # end




end


  # #Try 2
  # # Returns the Gravatar (http://gravatar.com/) for the given user.
  # def gravatar_for(user, options = { size: 50 })
  #   gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  #   size = options[:size]
  #   gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  #   image_tag(gravatar_url, alt: user.name, class: "gravatar")
  # end
  
  #Try 1
  # def gravatar_for(user)
  #   gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  #   gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  #   image_tag(gravatar_url, alt: user.name, class: "gravatar")
  # end