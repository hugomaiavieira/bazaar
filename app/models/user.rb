class User < ActiveRecord::Base
  # Include default devise modules. Others available are: :confirmable,
  # :lockable, :timeoutable, :trackable, :recoverable, :registerable and
  # :omniauthable
  devise :database_authenticatable, :rememberable, :validatable
end
