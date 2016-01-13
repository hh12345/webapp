class ReviewsController < ApplicationController
    before_action :signed_in_user
    
    def new
        @activity=Activity.find_by_id(params[:activity_id])
        @review_now=@activity.reviews.build
        @reviews=Review.where(:activity_id=>params[:activity_id])
    end
    def create
        @review_now=Activity.find_by_id(params[:activity_id]).reviews.build
        @review_now.user_id=current_user.id
        @review_now.comments=params[:review][:comments]
        @review_now.save
        @activity=Activity.find_by_id(params[:activity_id])
        redirect_to new_activity_review_path(@activity)
       
    
    end
    def update
    end
    def destroy
    end
    def show
    end


end
