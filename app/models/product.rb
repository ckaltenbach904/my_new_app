class Product < ApplicationRecord
    has_many :orders
    has_many :comments
    validates :name, presence: true
    validates :description, presence: true
    validates :image_url, presence: true
    validates :colour, presence: true
    validates :price, numericality: true, presence: true


    def self.search(search_term)
        Product.where("name LIKE ? OR description LIKE ? OR colour LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end

    def highest_rating_comment
        comments.rating_desc.first
    end

    def lowest_rating_comment
        comments.rating_asc.first
    end

    def average_rating
        comments.average(:rating).to_f
    end

    def price_in_cents
        (price * 100).to_i
    end

end


