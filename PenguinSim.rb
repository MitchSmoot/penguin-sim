def greeting
  puts "Hello! what is your name?"
  $name = gets.chomp.downcase
  $name.capitalize!
  puts `clear`
  case $name # unique response and nickname given based on people I know
    when "Mitch"
      puts "Greetings, my creator!"
      $name = "Baron Von Smooticus"
    when "Vickie", "Mom"
      puts "Greetings Mom! You are the best mother in the world!"
      $name = "WorldsGreatestMom"
    when "Brian", "Dad"
      puts "Hi, Dad!"
      $name = "Dad's face"
    when "Ben"
      puts "Greetings! My brother!"
      $name = "Bro"
    when "Exit"
      exit # Quits program
    else 
      puts "Hello #{$name}!"
      puts "It's nice to meet you!"
  end
  mainMenu
end

def nextVictim # If the human dies, seek out next victim. (restarts program to greeting phase)
  puts " . . . "
  puts "awaiting next victim. . . . ."  
  greeting
end

$debug = false

def toggleDebugMode
  if $debug == true
    $debug = false
  else
    $debug = true
  end
end

class Penguin

  def initialize petname
    @petname           = petname
    @foodInBelly       = 6
    @stuffInIntestine  = 0
    @warmth            = 2
    @happiness         = 6
    @age               = 0
    @hitpoints         = 10    # not used yet
    @sleeping          = false
    @barf              = false
    @poop              = false
    puts `clear`
    puts "#{@petname} is born!"
  end

  # Consider possibly moving "action" method into "Penguin" class to simplify code                         ***

  def penguinCall
    penguinCallArray = ["Cheep! Cheep!","Noot! Noot!","Cheep! Cheepy Cheeeep!","Herp Derp!","Meep! Meep!","Bork! Bork! Bork!","Meepity meep Cheepy Cheep Noot! Noot!","YakYakYak!","Noot!","KAAH! kuckaah!","Yarpity Blarp Yak! Yak! Cheepity Cheep!","Meep Meep, Cheep Cheep!","Dork! Dork! Dork!","Chirpity ChirpChip CHURP!","Meep! Meeeeeep! meepity meep meep!","Kwak Kwaaah Kuckaaah!","Huh HehHh Hello!","ChirpChirp! Yak!","Noot! #{$name} Noooooot!","Meeep! meepy meep!","Hello #{$name}! Yak! Yak! Yak!","nooot...noot.. Noot! Noot!","Pen pen Pen pen PENGUIN!","I like to eat seafood! Noot! Noot!"]
    c = rand(@age)
    if c < penguinCallArray.length
      return penguinCallArray[c]
    else
      return "Hello #{$name}! I'm a penguin and I can talk!"
    end
  end

  def wait
    puts "#{$name} lazily waited around"
    puts "#{@petname} chirps \"#{penguinCall}\""
    puts "#{@petname} is not pleased."
    passageOfTime
  end

  def feed
    puts "What would you like to feed #{@petname}?"
    foodType = gets.chomp.downcase
    case foodType
    when "help" # secret command to show food options
      puts "penguins like to eat shrimp, fish, tuna, crab, krill, peaches, souls, humans, etc."
    when "shrimp", "fish", "tuna", "crab", "krill", "peaches", "peach pie", "blackberries", "food", "seafood", "trout", "pie", "cake", "berries", "lettuce", "salmon", "halibut", "herring", "carp"
      puts "#{$name} fed #{@petname} some delicious looking #{foodType}!"
      if @foodInBelly >= 10 # penguin is too full to eat
        puts "#{@petname} did not eat the #{foodType}!"
        @happiness = @happiness - 1
      elsif @foodInBelly <= 3 # penguin is very hungry, needs two meals
        @foodInBelly = @foodInBelly + 6
        puts "#{@petname} ravenously gobbles up all of the #{foodType}! #{@petname} doesn't appear satisfied"
      else # penguin is moderately hungry
        @foodInBelly = @foodInBelly + 6
      puts "#{@petname} eats it all up! #{@petname} exclaims \"Noot! Noot!\"."
      @happiness = @happiness + 1
      end
    when "soul", "souls"
      puts "#{@petname} devours #{$name}'s soul!"
      nextVictim
    when @petname.downcase
      puts "#{$name} feeds #{@petname} to #{@petname}"
      puts "The universe implodes"
      puts "#{$name} died"
      nextVictim
    when "hemlock", "poison", "cyanide"
      puts "#{$name} attempts to feed #{@petname} some #{foodType}"
      puts "#{@petname} spits the poisonous #{foodType} back into the face of #{$name}!"
      puts "#{$name} died"
      nextVictim
    when "bomb", "explosive", "tnt", "grenade", "gasoline", "gas"
      puts "#{$name} feeds #{foodType} to #{@petname}!"
      puts "#{@petname} enthusiastically gobbles up the #{foodType}!"
      puts "#{@petname}'s stomach groans suspiciously"
      puts "#{@petname} gives #{$name} a hug. #{penguinCall}"
      puts "#{@petname} explodes!"
      puts "#{$name} died."
      nextVictim
    else
      puts "#{$name} feeds #{@petname} some #{foodType}."
      puts "after some hesitation, #{@petname} gobbles up the #{foodType}"
      @foodInBelly = @foodInBelly - 1
      puts "#{@petname} barfs all over the place!"
      puts "#{@petname} is covered in barf! how disgusting!"
      @barf = true
      puts "Try feeding #{@petname} something that penguins would normally eat!"
    end
    passageOfTime
  end

  def putToBed
    puts "#{$name} puts #{@petname} to bed."
    @sleeping = true
    3.times do 
      if @sleeping
        puts "#{@petname} snores adorably"
        @warmth = @warmth + 2
        passageOfTime
      end
    end

    if @sleeping
      @sleeping = false
      puts "#{@petname} wakes up after a nice full sleep! #{penguinCall}"
      @happiness = @happiness + 2
    end
  end

  def bored  # When an unrecognized action is typed
    puts "#{@petname} is getting bored!"
    @happiness - 1
    passageOfTime
  end

  def walk # like a dog
    if @foodInBelly < 2
      puts "#{$name} tries to take #{@petname} out for a walk."
      puts "#{@petname} refuses"
      puts "#{$name} hears a grumbling sound coming from #{@petname}'s stomach"
    else
      puts "#{$name} takes #{@petname} out for a walk."
      @foodInBelly = @foodInBelly - 2 # Penguin burns a lot fo food
      @stuffInIntestine = @stuffInIntestine + 2
      @warmth = @warmth + 1
      if poopy?
        @stuffInIntestine = 0 
        puts "#{@petname} takes a dump! #{@petname} gives a satisfying chirp! #{penguinCall}"
        @happiness = @happiness + 1
      end
      if depressed?
        puts "#{@petname} pushes #{$name} in front of a bus!"
        puts "#{$name} died"
        puts "#{@petname} chirps with joy! #{penguinCall.upcase}"
        nextVictim
      end
      puts "#{@petname} gleefuly shouts \"#{penguinCall}\""
      passageOfTime
    end
  end

  def play
    puts "#{$name} plays with #{@petname}!"  # V text neets finishing  V                               ***

    if hot?
      puts "#{@petname}, out of desperation to release accumulated heat, breathes fire onto #{$name}!"
      puts "#{$name} is set on fire!"
      puts "#{$name} burns to death!"
      puts "#{@petname} chirps with joy! #{penguinCall}"
      nextVictim
    end

    if old?
      puts "#{@petname} falls over and has a heart attack"
      @pet = nil
      puts "#{@petname} has died!"
      mainMenu
    else
      puts "#{@petname} chirps with joy! #{penguinCall}"
    end
    @happiness = @happiness + 3 # penguin gets happier but burns more food
    @foodInBelly = @foodInBelly - 1
    @stuffInIntestine = @stuffInIntestine + 1
    @warmth = @warmth + 1
    passageOfTime
  end

  def bath
    puts "Give #{@petname} a bath of hot water, ice, or scorpions?"
    bathType = gets.chomp.downcase   # choose between different types of baths
    case bathType
    when "hot water", "water" # penguins dont like hot water but its necessary to clean poop or barf.
      puts "#{$name} fills the tub with hot water"
      puts "#{$name} puts #{@petname} into the tub"
      if stinky?
        puts "the water washes the stench away!"
        @barf = false
        @poop = false
      else
        puts "The water is too hot! #{@petname} is a penguin, remember?"
        @happiness = @happiness - 2
      end
      @warmth = @warmth + 3
    when "ice" # primary way to cool down the penguin
      puts "#{$name} fills the bath tub with ice."
      puts "#{$name} puts #{@petname} into the tub"
      @warmth = 0
      @happiness = @happiness + 2
      puts "#{@petname} feels refreshed!"
    when "scorpions"
      puts "#{$name} fills the bath tub with scorpions!"
      puts "#{$name} puts #{@petname} into the tub"
      if stinky?
        puts "The scorpions were repulsed by the stench of #{@petname}!"
        puts "The scorpions decide to eat #{$name} instead! Ouch!"
        puts "#{$name} died"
        nextVictim
      else
        "The scorpions swarm over #{@petname}. . ."
        if depressed? == false
          puts "#{@petname} cries out loudly! #{penguinCall.upcase}"
          puts "#{@petname} fights back, jumping up and down and pecking at the scorpions!"
          puts "#{@petname} jumps out of the tub after killing most of the scorpions"
          @happiness = @happiness - 10
        else 
          puts "#{@petname} chirps in agony!"
          puts "#{@petname} lacks the will to fight back."
          puts "#{@petname} stops moving."
          @pet = nil
          puts "The cops break down the door! #{$name} is arrested for animal cruelty."
          nextVictim
        end
      end
    else
      bath
    end
    passageOfTime
  end

  private # penguin metabolism, inner workings below this point.
  def hungry?
    @foodInBelly <= 3
  end
  def poopy?
    @stuffInIntestine >= 8
  end
  def depressed?
    @happiness <= 0
  end
  def hot?
    @warmth >= 8
  end
  def old?
    @age >= 20
  end
  def stinky?
    @poop || @barf
  end

  def passageOfTime
    if @foodInBelly > 0 # move food from belly to intestine
      @foodInBelly      = @foodInBelly      - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else 
      puts "#{@petname} starved to death!"
      @pet = nil
      mainMenu
    end

    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts "Eww, gross! #{@petname} had an accident!"
      puts "#{@petname} is covered in poop!"
      @happiness = @happiness - 2
      @poop = true
    end

    if poopy?
      if @sleeping # Penguin wakes up to go to the bathroom
        @sleeping = false
        puts "#{@petname} wakes up suddenly"
      end
      puts "#{@petname} does the potty dance!"
    end

    if hungry?
      if @sleeping # Penguin wakes up due to hunger
        @sleeping = false
        puts "#{@petname} wakes up suddenly!"
      end
      puts "The stomach of #{@petname} appears to be grumbling"
      @happiness = @happiness - 1
      if @foodInBelly <= 1
        puts "#{@petname} is ravenous! #{@petname} begs #{$name} for food!"
      end
    end

    if hot? 
      puts "#{@petname} is overheating!"
      @happiness = @happiness - 1
    end

    if stinky? # covered in penguin poop or penguin barf
      puts "#{@petname} smells terrible!"
      @happiness = @happiness - 1
    end

    if @age == 20
      puts "#{@petname} appears to be getting quite old! You will have to be more gentle from now on."
    end

    if @age == 30 
      puts "#{@petname} has grown old and wise and decides to reveal the secrets of the universe to #{$name}" 
      #                                                                                                      ****
    end

    @age = @age + 1 # penguin gets older each turn

    if $debug == true
    puts "food: #{@foodInBelly} happy: #{@happiness} poop: #{@stuffInIntestine} age: #{@age} heat: #{@warmth}"
    end

   # if @sleeping === false 
   #   action                      # old code, remove before finishing                                        ***
   # end
  end
end

def action # defines action for each turn
  puts " " # adds a space to separate each turn
  puts "choose: feed, walk, play, bed, bath, wait"
  act = gets.chomp.downcase
  case act
  when "feed"
    puts `clear`
    @pet.feed
  when "wait"
    puts `clear`
    @pet.wait
  when "bed"
    puts `clear`
    @pet.putToBed
  when "walk"
    puts `clear`
    @pet.walk
  when "play"
    puts `clear`
    @pet.play
  when "bath"
    puts `clear`
    @pet.bath
  when "call"
    puts `clear`
    puts @pet.penguinCall
    action
  when "exit"
    exit # Quits the program
  when "kill"
    @pet = nil # deletes pet
    mainMenu
  when "debug"
    toggleDebugMode
  when "clear"
    puts `clear`
  else # punishment for typing incorrectly
    @pet.bored
  end
  action
end

def mainMenu
  puts "---MAIN MENU---"
  puts "Type \"penguin\" to  access the Penguin Simulator!"
  puts "Type \"restart\" to restart the program!"
  puts "Type \"exit\" to exit the program!"
  puts "Commands: penguin, restart, exit"

  prompt = gets.chomp.downcase
  case prompt
  when "penguin", "p"
    puts `clear`
    puts "---Penguin Simulator---"
    puts "Name your Penguin!"
    @pet = Penguin.new gets.chomp # creates the new @pet penguin
    action
  when "cipher", "c"
    puts `clear`
    puts "---Mitch's cipher machine of DOOM!---"
    cipherMenu
  when "restart", "r"
    puts `clear`
	  puts "Restarting program..."
	  greeting
	when "exit", "end", "x"
	  puts "Goodbye, #{$name}!"
    exit
	else
	  puts "Error"
	  mainMenu
  end
end
puts `clear`
puts "---Mitch's thingymadoober program of awesomeness and cool things and stuff!---"
puts "---Version 1.0.0---"

#$name = "mitch" # uncomment if skipping greeting for debugging
greeting # use comment to skip to mainMenu for debugging
#mainMenu

# used concepts:
  # if/else, case
  # methods and classes
  # math
  # booleans
  # "or" comparator
  # types of variables
  # user input
  # .downcase, .capitalize
  # troubleshooting, bug hunting
  # ruby grammar, DRY code
  # copious comment notes
  # modular %

# unused concepts:
  # arrays and hashes
  # proc/lambda
  # changing letters in strings
  # random number generator