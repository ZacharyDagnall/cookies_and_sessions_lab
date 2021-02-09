class ProductsController < ApplicationController

    def index
       @products = Product.all
    #    @cart = cart
       @product = Product.new
       @cart_total = cart.sum{|p,a| a[0]*a[1]}
    end

    def add
        @product = Product.find_by(name: params[:product_name])
        # cart << @product unless !@product     # this was before i was making it a hash to keep track of quantity

        #cart should  be a hash. {product_name: [price, quant_in_cart]}
        if @product && cart[@product.name]
            cart[@product.name][1] += 1 #should just increase quant_in_cart, not price
        elsif @product
            cart[@product.name] = [@product.price, 1]
        end
        #byebug
        redirect_to products_path
    end

    private
    # def product_params
    #     params.permit(:product_name)
    # end

end
