class InstructorsController < ApplicationController


    # GET /instructors/:id
    def show
        instructor = find_instructor
        render json: instructor, only: [:name], status: :ok
    end

    # GET /instructors
    def index
        instructors = Instructor.all
        render json: instructors, only: [:name], status: :ok
    end

    # DELETE /instructors/:id
    def destroy
        to_destroy = find_instructor
        to_destroy.destroy
        head :no_content
    end

    # POST 
    def create
        new_instructor = Instructor.create!(instructor_params)
        render json: new_instructor, status: :created
    end
    # PATCH /instructors/:id
    def update
        to_update = find_instructor
        to_update.update!(instructor_params)
        render json: to_update, status: :accepted
    end

    private

    def find_instructor
        Instructor.find(params[:id])
    end
    def instructor_params
        params.permit(:name)
    end


end
