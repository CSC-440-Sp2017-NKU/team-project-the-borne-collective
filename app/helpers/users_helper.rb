module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  # Get type of User to create
  def options_for_type
  [
    ['student',   0],
    ['faculty',   1],
    ['registrar', 2],
    ['admin',     3],
  ]
  end
  
  
end