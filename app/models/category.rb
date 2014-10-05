class Category < ActiveRecord::Base
  validates :name, presence: true

  rails_admin do
    list do
      field :name
    end

    edit do
      field :name
    end
  end
end
