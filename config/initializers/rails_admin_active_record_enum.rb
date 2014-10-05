# Based on this gist: https://gist.github.com/dmilisic/38fcd407044ace7514df
# commented on this issue: https://github.com/sferik/rails_admin/issues/1993
#
# @hugomaiavieira: I changed the original gist to apply I18n. To work, the enum
# must have a tanslation defined. If we have a Model like this:
#
#   class Product
#     enum status: %w(stock sold removed)
#   end
#
# We must have a translation like this:
#
#  pt-BR:
#    enum:
#      product:
#        status:
#          stock: Estoque
#          sold: Vendido
#          removed: Devolvido
#

module ActiveRecord
  module RailsAdminEnum
    def enum(definitions)
      super

      definitions.each do |name, values|
        define_method("#{ name }_enum") do
          translation = I18n.t("enum.#{self.class.name.downcase}.#{name}")

          self.class.send(name.to_s.pluralize).map do |key, value|
            [translation[key.to_sym], value]
          end
        end

        define_method("#{ name }=") do |value|
          if value.kind_of?(String) and value.to_i.to_s == value
            super value.to_i
          else
            super value
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send(:extend, ActiveRecord::RailsAdminEnum)