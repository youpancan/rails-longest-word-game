require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
    @rand_array = []
    10.times { @rand_array << ('A'..'Z').to_a.sample }
  end

  def score
    @message = ''
    word = params[:word]
    rand_str = params[:rand_array]
    raise
    rand_array = rand_str.gsub('', ',')
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_serialized = URI.open(url).read
    english_word = JSON.parse(word_serialized)
    word.chars.each do |letter|
      if rand_array.include?(letter.upcase)
        if english_word["found"] == true
          @message = "Congratulations! #{word} is a valid English word!"
        else
          @message = "Sorry but #{word} does not seem to be a valid English word..."
        end
      else
        @message = "Sorry but #{word} can't be built out of #{rand_array}"
      end
    end
    # raise
  end
end
