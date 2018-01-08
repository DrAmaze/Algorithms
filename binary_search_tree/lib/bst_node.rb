class BSTNode
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert(value)
    if value <= @value
      @left.nil? ? @left = BSTNode.new(value) : @left.insert(value)
    else
      @right.nil? ? @right = BSTNode.new(value) : @right.insert(value)
    end
  end
end
