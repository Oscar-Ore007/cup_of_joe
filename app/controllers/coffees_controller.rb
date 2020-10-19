class CoffeesController < ApplicationController

    def new 
        @coffee = Coffee.new 
        @coffee.build_brand 
    end 

    def create 
        @coffee = coffee.new(coffee_params)
        if @coffee.save 
            redirect_to coffee_path(@coffee)
        else
            render :new 
    end 


    private 

    def coffee_params 
        params.require(coffee).permit(:flavor, :description, :brand_id, brand_attributes: [:name])
    end 

end
