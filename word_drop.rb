require 'unirest'

class GamePlay

  def initialize()
    response = Unirest.get("http://localhost:3000/api/words")
    @hidden_list = response.body["words"].shuffle!
    @word_list = [ ]
    @score = 0

   5.times do
      @word_list << @hidden_list.pop
    end
  end

  def intro_message
    system "clear"

    puts "################################################################"
    5.times do
      puts "#                                                              #"
    end
    puts "#                        Word Drop!                            #"
    5.times do
      puts "#                                                              #"
    end

    puts "################################################################

    Rules for Game Play:

    ############################################################

    1. Choose the correct part of speech from the list of words.   

    2. Two points for each correct answer.

    3. One point for each wrong word.

    4. A new word will appear after each choice.

    5. Try to get rid of as many words as possible.

    6. Beware - too many wrong answers ends the game!

    "
    puts "###############################################################"

    puts "Let's Play!"

    puts "###############################################################"
  end


  def draw
    @word_list.each_with_index do |word_hash, index|
       puts "#{index} - #{word_hash["content"]}"
    end
  end

  def check_prompts
    available_prompts = @word_list.map do |word_hash|
      pos_true = word_hash["part_of_speech"].select { |k, v| v == true }
      pos_true.map {|k, v| k }
    end
    @prompts = available_prompts.flatten.uniq
  end

  def make_guess
    @part_of_speech = @prompts.sample
    puts "Find the #{@part_of_speech}! Choose the number to select the answer!"
    guess = gets.chomp.to_i
    check_answer(guess)
  end

  def check_answer(index)
    if @word_list[index]["part_of_speech"][@part_of_speech]
      puts "Hooray! You got it! 2 points for you! "
      @score += 2
      @word_list.delete_at(index)
    else 
      puts "Aww snap! You missed! You lose 1 point. Womp Womp."
      @score -= 1
      @word_list << @hidden_list.pop
    end
    sleep 1
    system "clear"
  end

  def play_again
    puts 'Y to continue, Q to quit' 
    input = gets.chomp
    if input == "Y" 
      GamePlay.new.run
    elsif input == "Q"
      puts "Thank you for playing! Come back for more grammar fun soon!"
    end
  end


  def run
    intro_message
      while @hidden_list.any?
        draw
        check_prompts
        make_guess

      if @word_list.length == 0
        puts "You Won! Your final score is #{@score}!" 
        play_again
        response = Unirest.post(
                        "http://localhost:3000/api/game_plays", 
                        parameters: {
                                      user_id: 1,
                                      score: @score,
                                      level: 1
                                    }
                        )
        break
      elsif @word_list.length > 15 
        puts "You Lost! Good Try! Keep working harder!Your final score is #{@score}! Great Job!"
        play_again
        response = Unirest.post(
                        "http://localhost:3000/api/game_plays", 
                        parameters: {
                                      user_id: 1,
                                      score: @score,
                                      level: 1
                                    }
                        )
      end
    end
  end
end


GamePlay.new.run
