class Product < ApplicationRecord
    has_many :orders

    def self.search(search_term)
        Product.where("name LIKE ? OR description LIKE ? OR colour LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end
end


