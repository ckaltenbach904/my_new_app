module ProductsHelper
    def cache_key_for_products
        count          = @products.count
        max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
        "products/all-#{count}-#{max_updated_at}-#{params[:page]}"
    end

    def cache_key_for_product
        "products/#{@product.id}-#{@product.updated_at}-#{@product.comments.count}-#{signed_in?}"
    end
end
