module Decipherable

  def self.caesar_cipher(string, shift_factor = 0)
    encoded_string = string.each_char.map do |char|
      next char unless /[A-Za-z]/ =~ char

      byte = char.ord
      shift_factor.times do
        byte += 1
        byte = 97 if byte == 123
        byte = 65 if byte == 91
      end
      byte.chr
    end
    encoded_string.join
  end
end
