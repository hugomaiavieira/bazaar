class Customer < ActiveRecord::Base
  validates :name, presence: true

  rails_admin do
    list do
      field :name
      field :email
      field :phone
      field :birthday do
        date_format :default
      end
    end

    edit do
      field :name
      field :email
      field :phone
      field :birthday do
        date_format :default
      end
      field :document
      field :address
      field :obs
    end

    show do
      field :name
      field :email
      field :phone
      field :birthday do
        date_format :default
      end
      field :document
      field :address
      field :obs
    end
  end
end
