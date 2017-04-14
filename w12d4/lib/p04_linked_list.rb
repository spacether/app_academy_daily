class Link
  attr_accessor :key, :val, :next, :prev

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
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
    @next = nil
    @prev = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @real_first = Link.new(:head, nil)
    @real_last = Link.new(:tail, nil)
    @real_first.next = @real_last
    @real_last.prev = @real_first
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @real_first.next
  end

  def last
    @real_last.prev
  end

  def empty?
    @real_first.next == @real_last
  end

  def find_link(key)
    return nil if empty?
    self.each do |link|
      return link if link.key == key
    end
    nil
  end

  def get(key)
    link = find_link(key)
    return link.val if !link.nil?
    nil
  end

  def include?(key)
    link = find_link(key)
    !link.nil?
  end

  def append(key, val)
    link = Link.new(key, val)
    if empty?
      @real_first.next = link
      @real_last.prev = link
      link.prev = @real_first
      link.next = @real_last
    else
      insert(link)
    end
    link
  end

  def insert(link)
    link.prev = last
    last.next = link
    link.next = @real_last
    @real_last.prev = link
  end

  def update(key, val)
    link = find_link(key)
    return nil if link.nil?
    link.val = val if !link.nil?
  end

  def remove(key)
    link = find_link(key)
    return nil if link.nil?
    link.remove
    true
  end

  def each
    return [] if empty?
    link = @real_first.next
    while link != @real_last
      yield link
      link = link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
