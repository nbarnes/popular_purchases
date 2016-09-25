class User

  attr_accessor :username, :email

  def self.find(term_type, term)
    return nil unless term_type == :email || :username
    fetch_users unless @@users
    if term_type == :username
      return nil unless @@users.has_key?(term)
      return User.new(term, @@users[term])
    else
      return nil unless @@users.value?(term)
      return User.new(@@users.get_key[term], term)
    end
  end

  private
    @@users = nil

    def initialize(username, email)
    end

    def self.fetch_users
      @@users = {}
      HTTParty.get('http://74.50.59.155:6000/api/users')["users"].each do |user|
        @@users[user["username"]] = user["email"]
      end
    end
end
