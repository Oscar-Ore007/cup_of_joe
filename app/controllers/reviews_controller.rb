class ReviewsController < ApplicationController

    def new 
       @coffee =  Coffee.find_by_id(params[:coffee_id])
       @review = @coffee.reviews.build 
    end 

    def create 
        Review.create(review_params)
        redirect_to review_path(@review)
    end 

    def show
        review belongs_to coffee 
        @review.coffee  
    end 

    def index 

    end 

   
    private 

    def review_params
        params.require(:review).permit(:coffee_id, :content, :stars, :title)
    end 
end
