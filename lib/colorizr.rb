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
  
  class_eval do
  	def color(code)
  		"\e[#{code}m#{to_s}\e[0m"
  	end
  	@@colorizr_colors.each do |color, code|
  		class_eval "def #{color}; color #{code}; end"
  	end
  end
end

