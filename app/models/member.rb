class Member < ActiveRecord::Base
  has_many :pieces

  validates :name, :email, :phone, :tax, presence: true
  validates :tax , numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }

  rails_admin do
    list do
      field :name
      field :email
      field :phone
    end

    edit do
      field :name
      field :email
      field :phone
      field :document
      field :birthday do
        date_format :default
      end
      field :address
      field :tax do
        help 'Obrigatório. Em porcentagem (%).'
      end
      field :pieces
      field :obs
    end

    show do
      field :name
      field :email
      field :phone
      field :document
      field :birthday do
        date_format :default
      end
      field :address
      field :tax
      field :pieces
      field :obs
    end
  end
end
