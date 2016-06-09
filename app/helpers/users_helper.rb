module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
    email_digest = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{email_digest}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end
end
