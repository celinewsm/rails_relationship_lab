class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course, notice: 'course was created successfully'
    else
      render :new
    end
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def show
    @course = Course.find(params[:id])
  end

  def update
    c = Course.find(params[:id])
    c.update(course_params)
    redirect_to courses_path
  end

  def destroy
    Course.find(params[:id]).delete
    redirect_to courses_path
  end

  def course_params
    params.require(:course).permit(:name)
  end

end
