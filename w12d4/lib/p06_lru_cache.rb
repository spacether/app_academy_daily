require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new # key and link link list link
    @store = LinkedList.new #where to store items
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    link = @map.get(key)
    if link.nil?
      link = calc!(key)
    else
      link.remove
      @store.insert(link)
    end
    link.val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    val = @prc.call(key)
    link = @store.append(key, val)
    @map.set(key, link)
    eject! if count > @max
    link
  end

  def eject!
    old_link = @store.first
    old_link.remove #removes self from linklist
    @map.delete(old_link.key) #removes link from the hash map
  end
end
