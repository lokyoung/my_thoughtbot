puts 'Welcome to my guess game.'
puts '-' * 20

# rand(10) provides the number between 0 and 9.
number = rand(10) + 1
won = false

5.times do
  print 'Guess my number > '
  guess = gets.to_i
  # number = 10
  if guess == number
    won = true
    break
  end
end

if won
  puts 'You win!'
else
  # puts "You lost. The number is " + number.to_s
  puts "You lost. The number is #{number}"
end
