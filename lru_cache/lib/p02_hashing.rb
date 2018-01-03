class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    output = 0
    self.each_with_index do |hash1, (el, i)|
      output += (el.hash + i.hash) ^ hash1.hash
    end
    output
  end
end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort_by(&:hash).hash
  end
end
