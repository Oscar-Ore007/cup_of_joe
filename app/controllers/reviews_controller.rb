class ReviewsController < ApplicationController

    def new 
       @coffee =  Coffee.find_by_id(params[:coffee_id])
       @review = @coffee.reviews.build 
    end 

    def create 
        @review = Review.create(review_params)
        if @review.save #checks if its valid 
            redirect_to review_path(@review)
        else 
            render :new 
        end 
    end 

    def show
       @review = Review.find_by_id(params[:id])
    end 

    def index 

    end 

   
    private 

    def review_params
        params.require(:review).permit(:coffee_id, :content, :stars, :title)
    end 
end
