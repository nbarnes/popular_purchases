class User

  attr_accessor :username, :email

  def self.find(username)
    fetch_user(username) unless @@users.has_key? username
    return @@users[username]
  end

  def to_json
    return { username: username,
      email: email
    }
  end

  private
    @@users = {}

    def initialize(username, email)
      @username = username
      @email = email
    end

    def self.fetch_user(username)
      response = Rails.cache.fetch("user_#{username}", expires_in: 1.hour) do
        HTTParty.get("http://74.50.59.155:6000/api/users/#{username}")['user']
      end
      @@users[username] = response ? User.new(response['username'], response['email']) : nil
    end

end

# => {"users"=>
#   [{"username"=>"Morgan_Barton", "email"=>"Morgan_Barton@gmail.com"},
#    {"username"=>"Zula.Kilback", "email"=>"Zula.Kilback@hotmail.com"},
#    {"username"=>"Ryder64", "email"=>"Ryder64@hotmail.com"},
#    {"username"=>"Gina_Kautzer", "email"=>"Gina_Kautzer@gmail.com"},
#    {"username"=>"Rosanna.Robel89", "email"=>"Rosanna.Robel89@gmail.com"},
#    {"username"=>"Rodrigo91", "email"=>"Rodrigo91@hotmail.com"},
#    {"username"=>"Felicia44", "email"=>"Felicia44@hotmail.com"},
#    {"username"=>"London.Keebler", "email"=>"London.Keebler@yahoo.com"},
#    {"username"=>"Aida_Conroy71", "email"=>"Aida_Conroy71@hotmail.com"},
#    {"username"=>"Adalberto_Hamill", "email"=>"Adalberto_Hamill@yahoo.com"}]}
