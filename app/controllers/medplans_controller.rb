class MedplansController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:request_plan]

    def decide
        if current_user.doctor
            redirect_to "/medplan/all"
        else
            redirect_to "/medplan/"+current_user.id.to_s
        end
    end

    def show
        @plan = Medplan.find_by(user_id: params[:id])
        if !@plan.nil?
            @meds = Med.all.where("medplan_id = ?", @plan.id)
            @doctor = User.find_by(id: @plan.doctor_id)
        else
            redirect_to "/"
        end
    end

    def all
        @plans = Medplan.all 
    end
    def new
        @plan = Medplan.new
    end
    def create
        @plan = Medplan.new(medplan_params)
        @plan.doctor_id = current_user.id
        if @plan.save
          redirect_to "/medplan/"+@plan.user_id.to_s
        else
          render 'new'
        end
      end

    def delete
        @plan = Medplan.find_by(id: params[:id])
        @plan.delete
        redirect_to "/medplan/"
    end

    def get
        @plan = Medplan.find_by(user_id: params[:id])
        @doctor = User.find_by(id: @plan.doctor_id)
        @meds = Med.all.where("medplan_id = ?", @plan.id)
        @user = User.find_by(id: params[:id])
        respond_to do |format|
            format.json { render :layout => false }
        end
    end
    def request_plan
        @user = User.find_by(user_access_token: params[:uat])
        @plan = Medplan.find_by(user_id: @user.id)
        @doctor = User.find_by(id: @plan.doctor_id)
        @meds = Med.all.where("medplan_id = ?", @plan.id)
        respond_to do |format|
            format.json { render :layout => false }
        end
    end

    private

    def medplan_params
        params.require(:medplan).permit(:user_id)
    end

    
end
