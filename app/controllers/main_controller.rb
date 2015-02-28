class MainController < ApplicationController
  def index
  	@acceleration = 100


  end

  def new

  end

  def submit
  	v = params[ :d ].to_i / params[:t].to_i
  	redirect_to( { :action => 'result', :v => v } )
  end

  def result
  	@result = params[:v]

  end

end
