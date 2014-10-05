class Category < ActiveRecord::Base
  has_and_belongs_to_many :sizes

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  rails_admin do
    list do
      field :name
    end

    edit do
      field :name
      field :sizes
    end
  end
end
