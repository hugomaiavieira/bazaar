class Money
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def self.from_s(amount)
    amount.gsub!(/[^\d]/, '').to_i if amount.is_a?(String)
    new(amount)
  end

  def to_s
    @amount.to_s
  end
end

# Usage
#
# The params can be attributes symbols or Hashies { attribute: :method }
#
# class Payment < ActiveRecord::Base
#   acts_as_money :tax, value: :value_money
# end
#
# This permit you to set currency string values to an Integer attribute:
#
# payment = Payment.new
# payment.tax = 'R$ 2.535,00'
# => '253500'
# payment.tax
# => 253500
# payment.value_money = '23,99'
# => '2399'
# payment.value
# => 2399
#
module ActsAsMoney
  def acts_as_money(*args)
    args.each do |arg|
      if arg.is_a?(Hash)
        attribute, method = arg.keys.first, arg.values.first
      else
        attribute = method = arg
      end
      # see: http://goo.gl/mMqnx
      composed_of method,
                  class_name: 'Money',
                  mapping: [attribute, :amount],
                  converter: :from_s,
                  allow_nil: true
    end
  end
end

ActiveRecord::Base.send(:extend, ActsAsMoney)
