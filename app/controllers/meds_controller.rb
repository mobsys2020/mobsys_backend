class MedsController < ApplicationController

    def new
        @med = Med.new
        @med.name = params[:name]
        @med.quantity = params[:quantity].to_s
        @med.time = params[:time].to_s
        @med.days = params[:days].to_s
        @med.medplan_id = params[:medplan_id]
        @med.save
        

        redirect_to "/medplan/"+params[:user_id].to_s

    end
    def del
        @med = Med.find_by(id: params[:id])
        @medplan = Medplan.find_by(id: @med.medplan_id)
        redirect_to "/medplan/"+@medplan.user_id.to_s
        @med.delete

    end
end
