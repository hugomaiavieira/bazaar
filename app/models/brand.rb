class Brand < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  rails_admin do
    list do
      field :name
    end

    edit do
      field :name
    end
  end
end
