class PolyTreeNode

  attr_accessor :children
  attr_reader :value, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent)
    @parent.children.delete(self) if @parent != nil
    @parent = parent
    if @parent != nil
      parent.children << self
    end
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    child.parent = nil
    raise "Node is not a child" unless @children.include?(child)
  end

  def dfs(value)
    return self if self.value == value
    @children.each do |child|
      node = child.dfs(value)
      return node unless node.nil?
    end
    nil
  end

  def bfs(value)
    que = [self]
    until que.empty?
      node = que.shift
      return node if node.value == value
      que.concat(node.children)
    end
    nil
  end

end
