# Bowling-game

[![Image of CircleCI](https://circleci.com/gh/lucdelrio/bowling-game/tree/master.svg?style=svg)](https://circleci.com/gh/lucdelrio/bowling-game) [![codecov](https://codecov.io/gh/lucdelrio/bowling-game/branch/master/graph/badge.svg)](https://codecov.io/gh/lucdelrio/bowling-game)

Bowling-game is a application that shows the scoreboard of a bowling game on command-line, given a file with the game throws.

## Ruby version

* 2.5.3

## Build

After cloning the repository:

* Install dependencies: `bundle install`
* Run tests: `bundle exec rspec`

## How to use

* Run `ruby bowling_game.rb <BOWLING_TWHOWS_FILE>`

You can run the following command to check the output:

* `ruby bowling_game.rb ./public/two_players_game_example.txt`

or take your own file.

There are some example files on `public` folder
