class Link
  attr_accessor :next, :prev, :val, :key

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # removes self from list.
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new(:head)
    @tail = Link.new(:tail)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return nil if empty?
    @head.next
  end

  def last
    return nil if empty?
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |node|
      return node.val if key == node.key
    end
    nil
  end

  def include?(key)
    !get(key).nil?
  end

  def append(key, val)
    link = Link.new(key, val)
    last_item = @tail.prev
    last_item.next = link
    link.prev = last_item
    link.next = @tail
    @tail.prev = link
    link
  end

  def update(key, val)
    return nil unless include?(key)
    get_item(key).val = val
  end

  def remove(key)
    # return nil unless include?(key)
    get_item(key).remove
  end

  def each
    node = @head.next
    until node == @tail
      yield(node)
      node = node.next
    end
  end

  #uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end

  private
  def get_item(key)
    each { |el| return el if el.key == key }
  end

end
