require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new("spec")

require "dominion"
include Dominion

task :play do
  player_count = (ENV["players"] || 1).to_i
  michael = Player.new("Michael")
  dan = Player.new("Dan")
  katie = Player.new("Katie")
  players = [michael, dan, katie]

  Game.new(players[0...player_count]).play
end

task default: :spec
