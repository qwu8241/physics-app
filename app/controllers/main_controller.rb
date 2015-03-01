class MainController < ApplicationController
  def index
  	@acceleration = 100


  end

  def new

  end

  def submit
  	if params[:unit]== "acceleration_ask"
      acceleration = (params[ :final_velocity ].to_f - params[:initial_velocity].to_f)/params[:time].to_f
  	  redirect_to( { :action => 'result', :answer => acceleration} )
   elsif params[:unit]== "final velocity_ask" 
      final_velocity = params[ :initial_velocity ].to_f + params[:acceleration].to_f * params[:time].to_f
      redirect_to( { :action => 'result', :answer => final_velocity} )
    else
      redirect_to( { :action => 'result', :answer => "i only know how to do acceleration"} )
    end

      

  	#displacement = (params[ :initial_velocity ].to_f * params[:time].to_f)+(1/2)params[:acceleration].to_f
  	#redirect_to( { :action => 'result', :answer => displacement} )

  end

  def result
  	@result = params[:answer]

  end

end
