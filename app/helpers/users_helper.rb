module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, size: 80, img_class: "gravatar")
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: img_class)
  end
  
  # Returns a nicely formated date  --example: April 25, 2017  
  def humanize_join_date(date_time)
     return date_time.strftime("%B %d, %Y") 
  end
  
  # Returns reputation status tag
  def reputation_for(upvotes, downvotes) 
    if downvotes == 0
      return content_tag(:h4, "Good Poster!", style: "color:green")
    elsif (upvotes + downvotes) < 5
      return content_tag(:h4, "New Poster", style: "color:green")
    else
      vote_ratio = downvotes / upvotes.to_f
      if vote_ratio < 0.1
        return content_tag(:h4, "Great Poster!", style: "color: green")
      elsif vote_ratio < 0.18 
        return content_tag(:h4, "Good Poster", style: "color:#5fba7d")
      elsif vote_ratio < 0.25
        return content_tag(:h4, "Controversial Poster", style: "color:goldrod")
      else
        return content_tag(:h4, "Bad Poster", style: "color:red")
      end
    end
  end
  
end