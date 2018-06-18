require 'unirest'


response = Unirest.post(
                        "http://localhost:3000/api/game_plays", 
                        parameters: {
                                      user_id: 1,
                                      score: 17,
                                      level: 1
                                    }
                        ) 
  


# @hidden_list = response.body["words"].shuffle!
# @hidden_list_pos = 
# @word_list = [ ]
# @part_of_speech_list = [ ]


# 5.times do
#   @word_list << @hidden_list.pop
# end



@word_list = [{"id"=>2, "content"=>"smelly", "part_of_speech"=>{"noun"=>false, "verb"=>false, "adjective"=>true, "pronoun"=>false, "preposition"=>false, "article"=>false, "conjunction"=>false, "adverb"=>false}}, {"id"=>24, "content"=>"cries", "part_of_speech"=>{"noun"=>false, "verb"=>true, "adjective"=>false, "pronoun"=>false, "preposition"=>false, "article"=>false, "conjunction"=>false, "adverb"=>false}}, {"id"=>5, "content"=>"squishy", "part_of_speech"=>{"noun"=>false, "verb"=>false, "adjective"=>true, "pronoun"=>false, "preposition"=>false, "article"=>false, "conjunction"=>false, "adverb"=>false}}, {"id"=>19, "content"=>"sharp", "part_of_speech"=>{"noun"=>false, "verb"=>false, "adjective"=>true, "pronoun"=>false, "preposition"=>false, "article"=>false, "conjunction"=>false, "adverb"=>false}}, {"id"=>29, "content"=>"bear", "part_of_speech"=>{"noun"=>true, "verb"=>false, "adjective"=>false, "pronoun"=>false, "preposition"=>false, "article"=>false, "conjunction"=>false, "adverb"=>false}}, {"id"=>4, "content"=>"she", "part_of_speech"=>{"noun"=>true, "verb"=>false, "adjective"=>true, "pronoun"=>true, "preposition"=>false, "article"=>false, "conjunction"=>false, "adverb"=>false}}]

# @word_list.each do |element| 
#   element["part_of_speech"]["adverb"] = true
#   element["part_of_speech"]["noun"] = false
# end



 
#  map {|k, v| k }
# @word_list.each_key {|key| puts key }


just_keys = @word_list.map do |word_hash|
  key_value_pairs_where_true = word_hash["part_of_speech"].select { |k, v| v == true }
  key_value_pairs_where_true.map {|k, v| p k}
end

after_uniq = just_keys.flatten.uniq


p after_uniq


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
  end

# ["verb", "adjective", "adverb"]

# p @word_list.select { |word_hash| word_hash["part_of_speech"]["noun"] }

# array_of_hashes = [
#                     {"animal" => "cat", "name" => "Bill"},
#                     {"animal" => "dog", "name" => "Jasmine"},
#                     {"animal" => "parrot", "name" => "Sam"},
#                     {"animal" => "lizard", "name" => "Penelope"}
#                   ]

# p array_of_hashes.map {|element| element["name"]}

# hash = {"animal" => "cat", "name" => "Bill"}

# p hash.map {|k, v| k if v == "cat" && k if v == "name"}

# ["Bill", "Jasmine", "Sam", "Penelope"]

# (1..10).reject { |i|  i % 3 == 0 }   #=> [1, 2, 4, 5, 7, 8, 10]


# [1,2,3,4,5].select { |num|  num.even?  }   #=> [2, 4]

# index = 0
# @prompt_options = [ ]

# @word_list.each do 
#   if @word_list[index]["part_of_speech"]["noun"]
#     @prompt_options << "noun"
#   elsif @word_list[index]["part_of_speech"]["verb"]
#     @prompt_options << "verb"  
#   elsif @word_list[index]["part_of_speech"]["adjective"]
#     @prompt_options << "adjective"
#   end
#   index += 1
# end

# p @prompt_options.uniq

# @visiible_list.count do
# if @visiible_list[index]["part_of_speech"] == true
# parts_of_speech <<  ""
# else
# ignore
# end  
#  @visiible_list[index]["noun"]
# verb = @visiible_list[index]["verb"]
# adjective = @visiible_list[index]["adjective"]
# pronoun = @visiible_list[index]["pronoun"]
# preposition = @visiible_list[index]["preposition"]
# article = @visiible_list[index]["article"]
# conjunction = @visiible_list[index]["conjunction"]
# adverb = @visiible_list[index]["adverb"]
# end
# @visiible_list[0]["part_of_speech"].each do|key, value| 
#   puts"#{key} is {value}}" 
# end

# (1..10).find_all { |i|  i % 3 == 0 }   #=> [3, 6, 9]
# h = { "a" => 100, "b" => 200 }
# h.each {|key, value| puts "
# #{key} is #{value}" }
# produces:
# puts words[0]["part_of_speech"]["noun"]

# part_of_speech = true 

# index = 0 

# 3.times do
# case part_of_speech
#   when words[index]["part_of_speech"]["noun"] 
#       puts "Find the noun!"
#     when words[index]["part_of_speech"]["verb"] 
#       puts "Find the verb!"
#     when words[index]["part_of_speech"]["adjective"]
#       puts "Find the adjective!"
#     else
#       puts "Pick anything and move on with your life!"
#   end
#   index += 1
# end
