class MainController < ApplicationController
  def index
  	@acceleration = 100


  end

  def new

  end

  def submit
<<<<<<< HEAD
  	acceleration = (params[ :final_velocity ].to_f - params[:initial_velocity].to_f)/params[:time].to_f
  	redirect_to( { :action => 'result', :answer => acceleration} )

    final_velocity = params[ :initial_velocity ].to_f + params[:acceleration].to_f)*params[:time].to_f
  	redirect_to( { :action => 'result', :answer => final_velocity} )

  	displacement = (params[ :initial_velocity ].to_f * params[:time].to_f)+(1/2)params[:acceleration].to_f
  	redirect_to( { :action => 'result', :answer => displacement} )



=======
  	v = params[ :d ].to_i / params[:t].to_i
  	redirect_to( { :action => 'result', :v => v } )
>>>>>>> parent of 15fb30a... new
  end

  def result
  	@result = params[:v]

  end

end
