class StudentsController < ApplicationController

    def index
        @students = Student.all
    end
    
def show
    @students = Student.all
end


    def new
        @student = Student.new
    end
    
    def create
        # @student = Student.new
        # @student.first_name = params[:first_name]
        # @student.last_name = params[:last_name]
        @student = Student.new(student_params(:first_name, :last_name))
        @student.save
        redirect_to student_path(@student)
      end
    
    def edit
        @student = Student.find_by(id: params[:id])
    end
    
    def update
        @student = Student.find(params[:id])
        @student.update(student_params(:first_name, :last_name))
        redirect_to student_path(@student)
    end
    
    private

    def student_params(*args)
        params.require(:student).permit(*args)
      end

end