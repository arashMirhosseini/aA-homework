# PHASE 2
def convert_to_int(str)
  begin
    num = Integer(str)
  rescue ArgumentError => e
    puts "Argument error"
  end
  num
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message
    "No Coffee"
  end
end

class NoFruitError < StandardError
  def message
    "It is not a fruit!"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise NoFruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry 
  rescue NoFruitError => e
    puts e.message
  end
   
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known.to_i < 5
      raise StandardError.new "Friendship is less than five years!"
    end
    if name.length <= 0
      raise StandardError.new "You need to provide a name"
    end
    if fav_pastime.length <= 0
      raise StandardError.new "You need to tell me your fav pastime"
    end
    @name = name
    @yrs_known = yrs_known.to_i
    @fav_pastime = fav_pastime
    
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end