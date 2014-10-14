class Brand < ActiveRecord::Base
  has_many :pieces

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  rails_admin do
    visible false
  end
end
