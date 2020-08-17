require 'open-uri'
class GamesController < ApplicationController
  def new
  @letters = ('A'..'Z').to_a.sample(10)
  @initial_time = Time.now  
  end

  def score
    #binding.pry
    @word = params[:word]
    grid = params[:letters].split()
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    serialized_url = open(url).read
    word_found = JSON.parse(serialized_url) 
    delta = Time.now - Time.parse(params[:initial_time])
    if word_found['found'] && GamesHelper.checkWordInGrid(grid, @word)
      @score = (word_found['length'].to_i * 10 - delta).round
    else
      @score = 0
      @erro = word_found['error']
    end

  end
end
