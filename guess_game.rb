puts "Welcome to my guess game."
puts "-" * 20

print "Guess my number > "
guess = gets.to_i
number = 10

if guess == number
  puts "You win!"
else
  # puts "You lost. The number is " + number.to_s
  puts "You lost. The number is #{number}"
end
