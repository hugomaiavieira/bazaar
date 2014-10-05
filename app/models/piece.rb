class Piece < ActiveRecord::Base
  belongs_to :category
  belongs_to :size
  belongs_to :brand

  acts_as_money price: :price_money

  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :category, presence: true

  def name
    code
  end

  rails_admin do
    list do
      field :code
      field :category
      field :brand
      field :size
      field :status
      field :price do
        pretty_value do
          ActiveSupport::NumberHelper.number_to_currency(value.try(:/, 100.0))
        end
      end
    end

    edit do
      field :code
      field :category
      field :brand
      field :size
      field :status
      field :price_money do
        html_attributes do
          { class: 'currency', type: 'text' }
        end
      end
      field :entry_date  do
        date_format :default
      end
      field :outbound_date  do
        date_format :default
      end
      field :obs
    end

    show do
      field :code
      field :category
      field :brand
      field :size
      field :status
      field :price do
        pretty_value do
          ActiveSupport::NumberHelper.number_to_currency(value.try(:/, 100.0))
        end
      end
      field :entry_date  do
        date_format :default
      end
      field :outbound_date  do
        date_format :default
      end
      field :obs
    end
  end
end
