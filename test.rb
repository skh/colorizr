require 'colorizr'

puts "colors available: #{String.colors}"

puts "color test:"
String.colors.each do |s|
	puts "#{s}".send(s)
end
