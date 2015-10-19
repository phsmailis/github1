#THE PYRAMID 
height = ARGV[0].to_i
 output = ""
 height.times do |i|
  output << "*" * i += 1
 output << "\n"
end
puts output

#Who doesnt love the classics??
"The quick brown fox jumps over the lazy dog".downcase.delete(" ").chars.sort.join.squeeze
