module Shortener
	CHARACTERS = [('a'..'z').to_a,('A'..'Z').to_a,(0..9).to_a].flatten
	BASE = CHARACTERS.length

	def encode(id)
		encoded = ''
		return CHARACTERS[0] if id == 0
		while id > 0
      encoded << CHARACTERS[id%BASE]
      id = id/BASE
		end
    encoded.reverse
	end

	def decode(s)
	  mapping = 0
	  base = CHARACTERS.length
	  s.each_char { |c| mapping = mapping * base + CHARACTERS.index(c) }
	  mapping
	end
end