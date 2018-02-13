class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all &&@pictures = Picture.all
  end

  def show
    @teacher = Teacher.find(params[:id]) && @picture = Picture.find(params[:id])
  end

  def new
    @teacher = Teacher.new && @picture = Picture.new
  end

  def edit
    @teacher = Teacher.find(params[:id]) && @picture= Picture.find(params[:id])
  end

  def create
    @teacher = Teacher.new && @picture = Picture.new

    if @teacher.save || @picture.save
      redirect_to @teacher
    else
      render 'new'
    end
  end

  def update
     @teacher = Teacher.find(params[:id]) && @picture = Picture.find(params[:id])

    if @teacher.update(teacher_params) || @picture.update(picture_params)
      redirect_to @teacher
    else
      render 'edit'
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id]) && @picture= Picture.find(params[:id])
    @teacher.destroy && @picture.destroy

    redirect_to teachers_path
  end

  private

    def teacher_params
      params.require(:teacher).permit(:title, :name, :body, :picture)
    end

    def picture_params
      params.require(:picture).permit(:name, :url)
    end
end
