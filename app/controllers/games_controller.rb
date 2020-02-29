require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @input = params[:word]
    @api = 'https://wagon-dictionary.herokuapp.com/'
    @url = @api + @input
    word_serialized = open(url).read
    word = JSON.parse(word_serialized)
    word.found == "true" ? @found = true : @found = false
    @correct = true
    @input.split.each do |letter|
      if @letters.include? letter
        @letters.delete(letter)
      else
        @correct = false
      end
    end
  end
end
