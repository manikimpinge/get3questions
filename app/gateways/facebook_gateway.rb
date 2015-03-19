class FacebookGateway

  attr_accessor :oauth_token

  def initialize(oauth_token)
    self.oauth_token = oauth_token
  end

  def post_to_wall(post)
    return if self.oauth_token.blank?

    #TEMP - as fb doesnt link localhost values for link
    link = Rails.env.development? ? "http://www.google.com/" : post[:link]

    client.put_wall_post("&#9733;&#9733;&#9733;", {
      name:         post[:name],
      link:         link,
      caption:      post[:caption],
      description:  post[:description],
      picture:      post[:picture]
    })
  end

  private

  def client
    @client ||= Koala::Facebook::API.new(self.oauth_token)
  end

end
