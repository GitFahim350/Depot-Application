class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy



    #####Cart er line_Items e prod thakle just line item tar quantity barabe r na thakle lineItem ta create korbe then return kore dibe line Item. 
    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)
        if current_item
            current_item.quantity += 1
        else
            current_item = line_items.build(product_id:  product.id)
        end
        current_item
    end

    ####Cart er total price return korbe prottekta lineitem er price er        jogfol 
    def total_price
        line_items.to_a.sum { |item| item.total_price }
    end
end
