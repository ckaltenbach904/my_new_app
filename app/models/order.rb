class Order < ApplicationRecord
    belongs_to :product
    belongs_to :user

    def price_in_euros
        (total / 100).round(2)
    end
end