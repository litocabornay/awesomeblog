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

  # def sortable(column, title = nil)
  #   title ||= column.titleize
  #   direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
  #   link_to title, :sort => column, :direction => direction
  # end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
  
  

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