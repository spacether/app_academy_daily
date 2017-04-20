class BSTNode
  attr_reader :left, :right
  attr_accessor :parent, :val

  include Comparable
  def initialize(val = nil)
    @val = val
    @left = nil
    @right = nil
    @parent = nil
  end

  def <=>(other)
    @val <=> other.val
  end

  def left=(child)
    child.parent = self if !child.nil?
    @left = child
  end

  def right=(child)
    child.parent = self if !child.nil?
    @right = child
  end

  def nil?
    @val.nil?
  end

end

# a = BSTNode.new(1)
# b = BSTNode.new(2)
# c = BSTNode.new
# d = BSTNode.new(2)
# a.left = b
# p a
# p b
# p c.nil?
# p a == a
