class ReviewsController < ApplicationController

    def new 
       @coffee =  Coffee.find_by_id(params[:id])
       @review = @coffee.build_review 
    end 

    def index 

    end 
end
