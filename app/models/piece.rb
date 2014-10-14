class Piece < ActiveRecord::Base
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to :member

  enum status: %w(stock sold removed)

  acts_as_money price: :price_money

  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :category, presence: true

  after_create :define_code

  def name
    code
  end

  rails_admin do
    list do
      field :code
      field :member
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
      field :member
      field :category
      field :brand
      field :size
      field :status, :enum
      field :price_money do
        html_attributes do
          { class: 'currency', type: 'text' }
        end
      end
      field :entry_date do
        date_format :default
      end
      field :outbound_date do
        date_format :default
      end
      field :obs
    end

    show do
      field :code
      field :member
      field :category
      field :brand
      field :size
      field :status
      field :price do
        pretty_value do
          ActiveSupport::NumberHelper.number_to_currency(value.try(:/, 100.0))
        end
      end
      field :entry_date do
        date_format :default
      end
      field :outbound_date do
        date_format :default
      end
      field :obs
    end
  end

  private

  def define_code
    prefix = self.category_id.to_s.rjust(3, '0')
    sufix  = self.id.to_s.rjust(6, '0')
    update(code: "#{prefix}.#{sufix}")
  end
end
