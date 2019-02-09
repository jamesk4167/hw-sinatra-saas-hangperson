class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service
  
  
  attr_accessor :word, :guesses, :wrong_guesses
  
  

   def initialize()
   end
  
  def initialize(word)
    
    @word = word
    @guesses = ""
    @wrong_guesses = ""
  end
  
  def guess(guessed_letter)
    raise ArgumentError, 'Argument Cannot be empty' if guessed_letter.empty? == true

    small_letter =  guessed_letter.downcase
    
   
    
    
    if @word.include?(small_letter) && (!@guesses.include?(small_letter))
      @guesses.concat(small_letter)
      return true
    elsif  !@word.include?(small_letter) && (!@wrong_guesses.include?(small_letter)) 
      @wrong_guesses.concat(small_letter) 
      return true
    else
      return false
    end
      
    
   
  end  

  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

end
