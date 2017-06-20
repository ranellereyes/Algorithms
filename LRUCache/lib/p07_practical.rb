require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  count = HashMap.new(string.length)
  string.chars.each do |char|
    count.include?(char) ? count[char] += 1 : count[char] = 1
  end

  if string.length.even?
    count.all? { |k, v| node.val.even? }
  else
    odds = 0
    count.each { |k, v| odds += 1 if v.odd? }
    odds == 1
  end
end
