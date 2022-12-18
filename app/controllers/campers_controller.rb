class CampersController < ApplicationController

    def index
      render json: Camper.all
    end

    def show
        camper_find = Camper.find_by(id: params[:id])
        if camper_find
            render json: camper_find, serializer: CamperShowSerializer
        else
            render json: {error: "Camper not found"}, status: :not_found
        end
    end

    def create
        camper_create = Camper.create(new_camper_params)
        if camper_create.valid?
            render json: camper_create, status: :created
        else
            render json: {errors: camper_create.errors.full_messages}, status: :unprocessable_entity
        end

        # camper_create = Camper.new(new_camper_params)
        # if camper_create.save
        #     render json: camper_create#, serializer:
        # else
        #     render json: {errors: camper_create.errors.full_messages}, status: :unprocessable_entity
        # end

    end

    private

    def new_camper_params
        params.permit(:name, :age)
    end

end
