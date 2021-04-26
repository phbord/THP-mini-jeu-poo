require 'dotenv'
require 'pry'
require 'rspec'
require 'rubocop'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
#binding.pry

def perform
    p player1 = HumanPlayer.new("Josiane")
    p player1.life_points
    player1.show_state
end

perform