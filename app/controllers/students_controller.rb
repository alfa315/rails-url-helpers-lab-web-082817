class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
    @change = if @student.active
      @student.active = false
    elsif @student.active == false
      @student.active = true
    end
    @student.update(active: @change )
    redirect_to student_path(@student)
  end

  # def update
  #   @student = Student.find(params[:id])
  #   # if @student.active
  #   #   @student.active = false
  #   # elsif @student.active = false
  #   #   @student.active = true
  #   # end
  #   @student.update(active: params[:active])
  #   redirect_to student_path(@student)
  # end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
