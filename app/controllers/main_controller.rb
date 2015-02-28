class MainController < ApplicationController
  def index
  	@acceleration = 200


  end

  def new

  end

  def submit
  	c = params[ :a ].to_i + params[:b].to_i
  	redirect_to( { :action => 'result', :c => c } )
  end

  def result
  	@result = params[:c]

  end

end
