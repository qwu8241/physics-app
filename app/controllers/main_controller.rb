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

<<<<<<< HEAD
    final_v = params[ :initial_velocity ].to_f + params[:acceleration].to_f)*params[:time].to_f
    redirect_to( { :action => 'result', :answer => final_velocity} )
=======
>>>>>>> d3ea854d6bb5be3b5a28f2c28aba02742f7812fb



  end

  def result
  	@result = params[:v]

  end

end
