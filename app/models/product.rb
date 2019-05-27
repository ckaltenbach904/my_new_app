class Product < ApplicationRecord
    has_many :orders
    has_many :comments

    def self.search(search_term)
        Product.where("name LIKE ? OR description LIKE ? OR colour LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end

    def highest_rating_comment
        comments.rating_desc.first
    end

    def lowest_rating_comment
        comments.rating_asc.first
    end

end


