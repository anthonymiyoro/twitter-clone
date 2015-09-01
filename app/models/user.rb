class User < ActiveRecord::Base
    attr_accessible :avatar_url, :email, :name, :password, :password_confirmation, :username
    has_secure_password
    before_validation :prep_email
    validates :name, presence: true
    validates :username, uniqueness: true,
    validates :email, uniqueness: true, presence: true,
    validates :email, uniqueness: true, presence: true, format: { with: /^[\w.+-]+@([\w]+.)+\w+$/ }

    private

    def prep_email
        self.email = self.email.strip.downcase if self.email
    end
end
