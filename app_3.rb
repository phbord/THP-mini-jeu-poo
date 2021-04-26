require 'dotenv'
require 'pry'
require 'rspec'
require 'rubocop'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

Dotenv.load('.env')

#binding.pry

