#!/usr/bin/env ruby

require_relative './play'
require_relative './compare_code'
require_relative './mastermind_runner'

compare_code = CompareCode.new
guess_input = GetInput.new
play = Play.new(compare_code, guess_input)
code = Code.new


mastermind_runner = MastermindRunner.new(play, code)

mastermind_runner.execute
