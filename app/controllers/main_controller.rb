class MainController < ApplicationController
  def index
  	@acceleration = 100


  end

  def new

  end

  def submit
  	


  end

  def result
  	@result = params[:answer]

  end

end
