class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.map.with_index { |el, i| el.hash * i.hash }
        .inject(0) { |sum, el| sum += el }
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort_by(&:hash).hash
  end
end
