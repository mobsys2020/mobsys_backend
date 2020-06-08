class MedplansController < ApplicationController

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

    private

    def medplan_params
        params.require(:medplan).permit(:user_id)
    end
end
