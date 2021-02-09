class Product < ApplicationRecord

    def to_h
        self ? {name: self.name, price: self.price} : {}
    end


end
