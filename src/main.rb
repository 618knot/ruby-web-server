# frozen_string_literal: true

trap("TERM") { puts "exiting..."; exit }

puts 'running...'

loop do
  p :hoge
end
