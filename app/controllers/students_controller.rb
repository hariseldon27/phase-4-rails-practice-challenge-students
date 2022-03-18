class StudentsController < ApplicationController
    
    # GET /students
    def index
        students = Student.all
        render json: students, status: :ok, except: [:created_at, :updated_at]
    end
    # GET /students/:id
    def show
        student = find_student
        render json: student, status: :ok, except: [:created_at, :updated_at]
    end

    # POST /students
    def create
        new_student = Student.create!(student_params)
        render json: new_student, status: :created
    end
    
    # PATCH /students/:id
    def update
        student = find_student
        student.update!(student_params)
        render json: student, status: :accepted
    end

    # DELETE /students/:id
    def destroy
        student = find_student
        student.destroy
        head :no_content
    end
    private
    def find_student
        Student.find(params[:id])
    end
    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end
end
