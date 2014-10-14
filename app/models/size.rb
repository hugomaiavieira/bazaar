class Size < ActiveRecord::Base
  has_many :pieces

  default_scope { order(name: :asc) }

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  rails_admin do
    visible false

    edit do
      field :name
    end
  end
end
