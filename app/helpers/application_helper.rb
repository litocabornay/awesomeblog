module ApplicationHelper


#   def full_title(string = '')
#     base_title = "Awesome Blog App"
#     # if page_title_empty?
#      if string.blank?
#      base_title
#   else
#     # page_title + " | " + base_title
#      "#{string} | Awesome Blog"
#     end
#   end


   def full_title(page_title = '')
    #full_title - method
    base_title = "Awesome Blog App"
     if page_title.empty?
      base_title
     else
      page_title + " | " + base_title
     end
   end
   # for タイトル
  
end