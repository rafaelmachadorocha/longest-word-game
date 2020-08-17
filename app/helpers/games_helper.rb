module GamesHelper
  def self.checkWordInGrid(grid, word)
    word.chars.all? { |letter| word.count(letter) <= grid.count(letter.upcase) }
  end
end
