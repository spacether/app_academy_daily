require_relative "bst_node"

class BinarySearchTree
  def initialize
    @root = nil
  end

  def find(val)
    if @root.nil?
      return false
    else
      other = @root
      while !other.nil?
        compareval = val <=> other.val
        return true if compareval == 0
        other = compareval < 1 ? other.left : other.right
      end
      false
    end
  end

  def insert(el)
    if @root.nil?
      @root = el
    else
      other = @root
      while true
        compareval = el <=> other
        is_left = compareval <= 0 ? true : false
        child = is_left ? other.left : other.right
        if child.nil?
          is_left ? other.left = el : other.right = el
          break
        end
        other = child
      end
    end
  end

  def delete(el)
    is_left = el.parent <=> el < 1
    children = [el.left, el.right].compact
    parent = el.parent
    if children.empty?
      is_left ? parent.left = nil : parent.right = nil
    elsif children.length == 1
      is_left ? parent.left = chidren[0] : parent.right = chidren[0]
    elsif children.length == 2
      right_child = el.right
      left_child = el.left
      new_el = maximum(left_child)
      new_el.parent.right = nil #unlink new_el parent
      is_left ? parent.left = new_el : parent.right = new_el
      new_el.left = left_child #sets child.parent links too
      new_el.right = right_child #sets child.parent links too
      el.left, el.right = [nil] * 2
    end
    el.parent = nil
  end

  def is_balanced?
  end

  def in_order_traversal
  end

  def maximum(el)
    item = el
    while !item.right.nil?
      item = item.right
    end
    item
  end

  def depth
  end

  def show(items = [@root])
    children = []
    topstr = ""
    botstr = ""
    items.each do |item|
      return if item.nil?
      topstr += " #{item.val} "
      if !item.left.nil? && !item.right.nil?
        botstr += "/ \\"
        children << item.left
        children << item.right
      elsif !item.left.nil? && item.right.nil?
        botstr += "/  "
        children << item.left
      elsif item.left.nil? && !item.right.nil?
        botstr += "  \\"
        children << item.right
      end
    end
    puts topstr
    puts botstr
    show(children) if !children.empty?
  end
end

a = BinarySearchTree.new
b = BSTNode.new(2)
c = BSTNode.new(2)
d = BSTNode.new(3)
e = BSTNode.new(1)
f = BSTNode.new(0)
g = BSTNode.new(1.5)
h = BSTNode.new(1.9)
a.insert(b)
a.insert(c)
a.insert(d)
a.insert(e)
a.insert(f)
a.insert(g)
a.insert(h)
a.show
p a.find(4)
# p a
