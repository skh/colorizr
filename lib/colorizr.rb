class String
	class_variable_set(:@@colorizr_colors, {
		black: 30,
		red: 31,
		green: 32,
		yellow: 33,
		blue: 34,
		light_gray: 37,
		light_blue: 94,
		pink: 95,
		white: 97
	})

	def self.colors
	  @@colorizr_colors.keys
	end
  
  def self.create_colors
	  class_eval do
	  	def color(code)
	  		"\e[#{code}m#{to_s}\e[39m"
	  	end
	  	@@colorizr_colors.each do |color, code|
	  		class_eval "def #{color}; color #{code}; end"
	  	end
	  end
	end
end

String.instance_eval do
	self.create_colors

	def sample_colors
		colors.each do |s|
			puts "This is " + "#{s}".send(s)
		end
	end
end
