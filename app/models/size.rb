class Size < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :pieces

  default_scope { order(name: :asc) }

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  rails_admin do
    list do
      field :name
      field :categories
    end

    edit do
      field :name
      field :categories
    end
  end
end
