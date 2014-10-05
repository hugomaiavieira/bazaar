class Category < ActiveRecord::Base
  has_and_belongs_to_many :sizes
  has_many :pieces

  default_scope { order(name: :asc) }

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
