require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    link = @map.get(key)
    #debugger
    if link
      update_link!(link)
    else
      eject! if count == @max
      val = @prc.call(key)
      link = @store.append(key, val)
      @map[key] = link
    end
    @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    @store.remove(link.key)
    new_link = @store.append(link.key, link.val)
    @map[link.key] = new_link
  end

  def eject!
    link = @store.first
    @store.remove(link.key)
    @map.delete(link.key)
  end

end
