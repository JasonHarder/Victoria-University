class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
    @teacher.build_teacher_picture
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def create
    @teacher = Teacher.new
      if @teacher.save
        flash[:notice] = "added faculty member"
          redirect_to @teacher
      else
        render 'new'
      end
  end

  def update
    @teacher = Teacher.find(params[:id])
      if @teacher.update(teacher_params)
        flash[:notice] = "Successful update"
        redirect_to @teacher
      else
        render 'edit'
      end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
      redirect_to teachers_path, notice: "successfully deleted member"
  end

  private
    def teacher_params
      params.require(:teacher).permit(:title, :name, :body, picture_attributes:
      [:id, :url, :name])
    end

end