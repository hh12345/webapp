class ParticipationsController < ApplicationController
  before_action :signed_in_user
  
  def show
    @participations=current_user.participations
    
    
    
  end
  
  def new
      if Activity.find_by_id(params[:activity_id]).user_id!=current_user.id
        if  current_user.participations.find_by_activity_id(params[:activity_id])==nil
          @participation=Activity.find_by_id(params[:activity_id]).participations.build
          @participation.user_id=current_user.id
          @participation.save
          flash[:success]="参加成功！"
          redirect_to users_path
        else if current_user.participations.find_by_activity_id(params[:activity_id]).user_id!=current_user.id
          @participation=Activity.find_by_id(params[:activity_id]).participations.build
          @participation.user_id=current_user.id
          @participation.save
          flash[:success]="参加成功！"
          redirect_to users_path
        else
          flash[:error]="你已经参加了该活动！"
          redirect_to users_path
        end
        end
      else 
        flash[:error]="你已经是活动发起人！"
        redirect_to users_path
      end
      
      #redirect_to "/participations#show"
  end
  def create
     current_user.participations << Activity.find_by_id(params[:activity_id])
     
     
    
  end

  def destroy
    @participation=Participation.find_by_id(params[:id])
    @participation.destroy
    flash[:success]="删除成功！"
    redirect_to users_path
    
  end
  
  def partner
    @participations=Participation.where(:activity_id=>params[:id])
    
  end
  private
    
    
  
end
