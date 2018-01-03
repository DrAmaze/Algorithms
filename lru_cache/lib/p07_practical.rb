require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  if string.length % 2 == 0
    string.chars.each do |let|
      return false if string.chars.count(let) % 2 != 0
    end
  else
    odds = 0
    string.chars.each do |let|
      odds += 1 if string.chars.count(let) % 2 != 0
      return false if odds > 1
    end
  end
  true
end
