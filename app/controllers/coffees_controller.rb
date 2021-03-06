class CoffeesController < ApplicationController

    def new 
        @coffee = Coffee.new 
        @coffee.build_brand 
    end 

    def create 
        @coffee = Coffee.new(coffee_params)
        @coffee.user_id = session[:user_id]
        if @coffee.save #This is where validations happen
            redirect_to coffee_path(@coffee)
        else
            render :new 
        end 
    end 

    def index 
        @coffees = Coffee.order_by_rating.includes(:brand)
    end 

    def show
        @coffee = Coffee.find_by_id(params[:id])
    end 


    private 

    def coffee_params 
        params.require(coffee).permit(:flavor, :description, :brand_id, brand_attributes: [:name])
    end 

end
