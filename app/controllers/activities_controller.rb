class ActivitiesController < ApplicationController
    before_action :signed_in_user, only: [:new, :create, :destroy]
    
    def new
    
        @activity=current_user.activities.new
    end
    def edit
        @activity=current_user.activities.find(params[:id])
    end
    
    def create
        @activity = current_user.activities.build(activity_params)
        if @activity.save
            flash[:success] = "Activity created!"
            redirect_to users_path
        else
            render 'sessions/new'
        end
    end
    
    
    
    def update

        @activity=current_user.activities.find(params[:id])
        if @activity.update_attributes(activity_params)
            flash[:success] = '更新成功！'
            redirect_to activity_path(current_user)
        else
            flash[:error]='更新失败！'
            redirect_to edit_activity_path(@activity)
        end
=begin
        @activity=current_user.activities.find(params[:id])
        @activity.update_attributes!(activity_params)
        flash[:notice]='更新完成'
        redirect_to activity_path(current_user)
=end
        
        
    end
    

    def destroy
       Activity.find(params[:id]).destroy
       flash[:success]="删除成功！"
       redirect_to activity_path(current_user)
        
    end
    

    def show
        @user = User.find(params[:id])
        @activities = @user.activities.paginate(page: params[:page])
    
    end
    def detail
        activities=Activity.all
        @activity=activities.find(params[:id])
        
    end


   
    
    
    private
        def activity_params
            params.require(:activity).permit(:title,:style,:introduction,:limitednumber,:starttime,:deadline)
        end
        def correct_activity
            @activity = current_user.activities.find_by(id: params[:id])
            redirect_to root_url if @activity.nil?
        end

end