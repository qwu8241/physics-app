class MainController < ApplicationController
  def index
  end

  def new

  end

  def page
     @first_var= params[:given1]
     @second_var= params[:given2] 
     @third_var= params[:given3] 
  end
##############################################################
  def submit
    g=[params[:given1],params[:given2],params[:given3]]
    for i in 1..3 do 
      if params["given#{i}"] == "acceleration"
        acceleration = params["a#{i}"]
      elsif params["given#{i}"] == "displacement"
        displacement = params["a#{i}"]
      elsif params["given#{i}"] == "time"
        time = params["a#{i}"]
      elsif params["given#{i}"] == "initial_velocity"
        initial_velocity = params["a#{i}"]
      elsif params["given#{i}"] == "final_velocity"
        final_velocity = params["a#{i}"]
      end
    end
    if params[:unit]== "acceleration_ask"
        redirect_to( { :action =>'acceleration',:array => g, 
          :final_velocity=>final_velocity,:initial_velocity=>initial_velocity,
          :time=>time,:displacement=>displacement})
      elsif params[:unit] =="displacement_ask"
        redirect_to( { :action =>'displacement',:array => g, 
          :final_velocity=>final_velocity,:initial_velocity=>initial_velocity,
          :time=>time,:acceleration=>acceleration})
      elsif params[:unit] =="time_ask"
        redirect_to({:action=> "time"})
      elsif params[:unit] =="initialvelocity_ask"
        redirect_to({:action=> "initial_velocity",:array => g, 
          :final_velocity=>final_velocity,:acceleration=>acceleration,
          :time=>time,:displacement=>displacement})
      elsif params[:unit] =="finalvelocity_ask"
        redirect_to({:action=> "final_velocity"})
    end
  end
###################################################################
  def acceleration
    g=params[:array]
    if g.include?("displacement") == false then
      acceleration = (params[:final_velocity ].to_f - params[:initial_velocity].to_f)/(params[:time].to_f)
     elsif g.include?("final_velocity") == false then
      acceleration = ((params[:displacement].to_f/params[:time].to_f)-params[:initial_velocity].to_f)*(2/params[:time].to_f)
     elsif g.include?("time") == false then
      acceleration = ((params[:final_velocity].to_f**2)-(params[:initial_velocity].to_f**2))/(params[:displacement].to_f*2)
     elsif g.include?("initial_velocity") == false then
      acceleration = ((params[:displacement].to_f/params[:time].to_f)-params[:final_velocity].to_f)*(-2/params[:time].to_f)
    end
    @acceleration=acceleration
    #@final_velocity=params[:final_velocity]
    #@initial_velocity=params[:initial_velocity]
    #@displacement=params[:displacement]
    #@time=params[:time]
  end
###################################################################
  def displacement
    g=params[:array]
    if g.include?("final_velocity") == false then
      displacement = (params[:initial_velocity].to_f*params[:time].to_f)+(0.5*params[:acceleration].to_f*(params[:time].to_f**2))
     elsif g.include?("acceleration") == false then
      displacement = (0.5*params[:time].to_f)*(params[:initial_velocity].to_f+params[:final_velocity].to_f)
     elsif g.include?("time") == false then
      displacement = ((params[:final_velocity]**2)-(params[:initial_velocity]**2))/(2*params[:acceleration])
     elsif g.include?("displacement") == false then
      displacement = (params[:final_velocity].to_f*params[:time].to_f)-(0.5*params[:acceleration].to_f*(params[:time].to_f**2))
    end
    @displacement=displacement
  end
####################################################################
  def initial_velocity
    g=params[:array]
    if g.include?("acceleration") == false then
      initial_velocity=((2.0*params[:displacement].to_f)/params[:time].to_f)-params[:final_velocity].to_f
     elsif g.include?("final_velocity") == false then
      initial_velocity=params[:displacement].to_f-(params[:acceleration].to_f*params[:time].to_f)
     elsif g.include?("displacement") == false then
      initial_velocity=(params[:final_velocity].to_f/params[:time].to_f)-(0.5*params[:acceleration].to_f*params[:time].to_f)
     elsif g.include?("time") == false then
      initial_velocity=((params[:final_velocity]**2)-(2.0*params[:acceleration]*params[:displacement]))
    end
    @initial_velocity=initial_velocity
  end
####################################################################
  def final_velocity
  end
####################################################################
  def time
  end
###############################################################
  def result
  	@result = params[:answer]
  end

end
