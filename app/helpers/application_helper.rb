module ApplicationHelper
  
  #Return a title on a per=page basis
  def title
    base_title = "Bonvee.com"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    logo = image_tag("bonvee.png", :alt => "Bonvee", :class => "round")  
  end
  
end
