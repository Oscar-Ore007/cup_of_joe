class ReviewsController < ApplicationController

    def new 
      if @coffee =  Coffee.find_by_id(params[:coffee_id])
       @review = @coffee.reviews.build 
      else 
        @review = Review.new 
      end 
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

        if params[:coffee_id]
            @coffee =  Coffee.find_by_id(params[:coffee_id])
            @reviews = @coffee.reviews 
        else

        @reviews = Review.all 
    end 
end 

   
    private 

    def review_params
        params.require(:review).permit(:coffee_id, :content, :stars, :title)
    end 
end
