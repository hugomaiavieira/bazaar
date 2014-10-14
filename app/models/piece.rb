class Piece < ActiveRecord::Base
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to :member

  enum status: %w(stock sold removed)

  acts_as_money price: :price_money

  validates :category, presence: true
  validates :code, uniqueness: { case_sensitive: false }

  has_attached_file :image, :styles => { :thumb => "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  after_create :define_code

  def self.redefine_all_codes
    all.each(&:define_code)
  end

  def name
    code
  end

  def define_code
    prefix = self.category_id.to_s.rjust(2, '0')
    sufix  = self.id.to_s.rjust(4, '0')
    update(code: "#{prefix}.#{sufix}")
  end

  rails_admin do
    list do
      field :image
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
      field :image
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
      field :image
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
end
