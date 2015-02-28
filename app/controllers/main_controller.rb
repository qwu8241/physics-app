class MainController < ApplicationController
  def index
  	@acceleration = 100


  end

  def new

  end

  def submit
  	if params[:acceleration_ask]
      acceleration = (params[ :final_velocity ].to_f - params[:initial_velocity].to_f)/params[:time].to_f
  	  redirect_to( { :action => 'result', :answer => acceleration} )
    end

   # final_velocity = params[ :initial_velocity ].to_f + params[:acceleration].to_f)*params[:time].to_f
  	#redirect_to( { :action => 'result', :answer => final_velocity} )

  	#displacement = (params[ :initial_velocity ].to_f * params[:time].to_f)+(1/2)params[:acceleration].to_f
  	#redirect_to( { :action => 'result', :answer => displacement} )

  end

  def result
  	@result = params[:answer]

  end

end
