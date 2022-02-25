class StudentsImportsController < ApplicationController
  def new
    @students_import = StudentsImport.new
  end

  def create
    @students_import = StudentsImport.new(params[:students_import])
    if @students_import.save
      redirect_to students_path
    else
      render :new
    end
  end

end
