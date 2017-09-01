#Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# Aquires file to be able to be used in the file that included in.
require_relative 'state_data'

class VirusPredictor

  # creating instance variables upon initialization
  def initialize(state_of_origin)
    @state = state_of_origin
    @population = STATE_DATA[state_of_origin][:population]
    @population_density = STATE_DATA[state_of_origin][:population_density]
  end


  #calling predicated deaths and speed of spread methods
  def virus_effects
    predicted_deaths
    speed_of_spread

    puts "#{@state} will lose #{@number_of_deaths} people in this outbreak and will spread across the state in #{@speed} months."
    puts
  end

  private

  #takes in the three arguements and performs calculation to determine number of predicted deaths. 
  def predicted_deaths
    # predicted deaths is solely based on population density
    death_rate = 
      if @population_density >= 200
        0.4
      elsif @population_density >= 150
        0.3
      elsif @population_density >= 100
        0.2
      elsif @population_density >= 50
        0.1
      else
        0.05
      end
    @number_of_deaths = (@population * death_rate).floor
  end

  # takes in two arguements and depending on population density calculated the speed it will spread throughout the state.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    @speed = 
      if @population_density >= 200
        0.5
      elsif @population_density >= 150
        1
      elsif @population_density >= 100
        1.5
      elsif @population_density >= 50
        2
      else
        2.5
      end
  end
end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


STATE_DATA.each do |state, data|
   VirusPredictor.new(state).virus_effects
end
 

#=======================================================================
# Reflection Section
#John was wonderful and stayed with us for long time and went through each part with us. Gabriela was also awesome and was very active engaging in the conversation. 