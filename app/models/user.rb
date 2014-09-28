class User < ActiveRecord::Base
  # Include default devise modules. Others available are: :confirmable,
  # :lockable, :timeoutable, :trackable, :recoverable, :registerable and
  # :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  rails_admin do
    list do
      field :email
    end

    edit do
      field :email
      field :password
      field :password_confirmation
    end
  end
end
