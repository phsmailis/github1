def computer
  print "\nplayer@Rooby-World:|$ "
  confirm = gets.chomp.downcase
  case confirm
  when "help"
    puts "\nList of commands:"
    puts "- exit [n]"
    puts "- alias [-p] [name[=value]"
    puts "- pwd [-LP]"
    computer
  when "pwd"
    puts "\n/Rooby/World/Controls/"
    computer
  when "exit"
    real_world
  else
    puts "\nNo command found. Please try again."
    computer
  end
end

def finish
  puts "\nYou make your way to the computer."
  puts "If you input correct command you will leave this world."
  puts "On the screen you see a command prompt which shows: "
  puts "\nPlease enter a command - 'help' for a list of commands"
  computer
end

def enemy_atk
  enemy_roll = rand(6).floor
  enemy_dmg = enemy_roll * 1
  puts "\n*Ancient creature attacks you for #{enemy_dmg}*"

  @player_hp -= enemy_dmg

  if @player_hp <= 0
    puts "\nThe Ancient creature has killed you. You lose."
    death
  else
    puts "*Your health: #{@player_hp}hp*"
    player_atk
  end
end

def player_atk
  player_roll = rand(6).floor
  player_dmg = player_roll * 2
  puts "\n\t**You attack Ancient creature with your #{@selected_weapon} for #{player_dmg}**"

  @enemy_hp -= player_dmg

  if @enemy_hp <= 0
    puts "\nYou finish off the Ancient creature with one final blow from your #{@selected_weapon}!"
    finish
  else
    puts "\t**Ancient Creatue: #{@enemy_hp}hp**"
    enemy_atk
  end
end

def death
  puts "\nAll your deaths belong to us. Game over!"
  puts "\nTry again? Y / N"
  print ">> "
  confirm = gets.chomp.downcase
  if confirm.include?('y')
    start_game
  else
    puts "\nThanks for playing!"
  end
end


def trap_door
puts "\nThe creature charges at you, as it gets close you swiftly kick him."
puts "Hes standing above the trap door, now is your chance!"
puts "Maybe you use your #{@selected_weapon} to hit the button!"
puts "\nDo you use your weapon or run to the button? Weapon / Run"
print ">> "
confirm = gets.chomp.downcase
case confirm
when 'weapon'
  puts "\nYou throw your #{@selected_weapon} and hit the button."
  puts "The trap door opens and the creature falls to his death!"
  finish
when 'run'
  puts "\nYou make it half way to the button before the creature stabs you in the back!"
  puts "You fall to your knees and everything goes black."
  death
  end
end


def crypt
  puts "\nYou make your way through the dark hallways in the crypt."
  puts "Finally you make it into an open room."
  puts "At the end of the room you spot a computer."
  puts "'Could this be the way out of this world?'"
  puts "Before you can make it to the computer, behind you from the darkness"
  puts "appears an armored figure. This must be the ancient creature the sign outside mentioned."
  puts "You draw your #{@selected_weapon} and prepare to attack."
  puts "Before you do, you notice the creature standing right over a trap door."
  puts "You spot a button across the room."
  puts "\nDo you attack or try to hit the button? Attack / Trap"
  print ">> "
  confirm = gets.chomp.downcase
  case confirm
  when 'attack'
    player_atk
  when 'trap'
    trap_door
  end
end
#   if confirm.include?('attack')
#     player_atk
#   if confirm.include?('trap')
#     trap_door
#     end
#   end
# end

def real_world
  puts "\nYou slowly open your eyes and find yourself back in your room."
  puts "You turn and see your #{@selected_weapon} leaning on your night stand."
  puts "Fin"
  puts "\nMade by Paul Smailis!"
  puts "\nWant to play again? Y / N"
  print ">> "
  confirm = gets.chomp.downcase
  if confirm.include?('y')
    start_game
  else
    puts "\nThanks for playing!"
  end
end

def lever
  puts "\nDo you move the lever (up or down)?"
  print ">> "
  choice = gets.chomp.downcase

  if choice.include?('down')
    puts "\nThe old gate in front of you creaks and begins to open."
    puts "You enter into the crypt."
    crypt
  else
    choice.include?('up')
    puts "You hear chains rattling and notice spikes falling down from above you."
    puts "Quickly, before you die try the lever again!"
    lever
  end
end

def enter_world
  @player_hp = 30
  @enemy_hp = 25
  puts "You sheathe your #{@selected_weapon} and continue on into this mysterious world."
  puts "Walking foward you spot a sign outside of a crypt which reads: "
  puts "\n'To leave this world alive, enter and defeat the ancient creature'"
  puts "As you approach the gate to the crypt you notice a lever."
  lever
end

def start_game
#Start of the game
system("clear")
puts "\nBlackness. You feel as if your eyes are open but you have no vision."
puts "Suddenly, you see bright lines of light all around you."
puts "The lights continue for a short time then your vision starts to return."
puts "You feel a weight on your back and reach behind yourself to grab what seems to be a sword."
puts "While you're holding the sword in your hand it quickly turns to a staff, then a bow, then a hammer."
puts "A drop-down menu apears that says,"
puts "Choose your weapon type: "


# Weapons in an array
weapons = [ "staff", "sword", "hammer", "bow" ]

(0...weapons.length).each do |i|
  puts "#{i+1} | #{weapons[i]}"
end
print ">> "
choice = gets.chomp.to_i - 1
@selected_weapon = weapons[choice]

puts "The weapon in your grip begins to take the shape of a #{@selected_weapon}."
puts "Welcome to the world of Rooby Online"

puts "\nReady to play? Y / N"
print ">> "

confirm = gets.chomp.downcase
if confirm == 'y'
   enter_world
 else
   puts "Game over, you fail!"
end
end
start_game
