require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder

  LOCS = [
    [-2,1],
    [-1,2],
    [1,2],
    [2,1],
    [2,-1],
    [1,-2],
    [-1,-2],
    [-2,-1]
  ]

  def self.valid_move?(pos)
    pos.all? { |n| n.between?(0,7) }
  end

  def initialize(pos)
    @pos = pos
    @visited_positions = [pos]
    @root = build_move_tree(pos)
  end

  def unvisited?(loc)
    @visited_positions.include?(loc) == false
  end

  def new_move_positions(pos)
    moves = LOCS.map do |loc|
      [pos.first + loc.first, pos.last + loc.last]
    end
    moves.select do |loc|
      self.class.valid_move?(loc) && unvisited?(loc)
    end
  end

  def build_move_tree(pos)
    root = PolyTreeNode.new(pos)
    que = [root]
    until que.empty?
      current_node = que.shift
      moves = new_move_positions(current_node.value)
      moves.each { |m| @visited_positions << m}
      nodes = moves.map { |loc| PolyTreeNode.new(loc) }
      nodes.each { |child| current_node.add_child(child) }
      que.concat(nodes)
    end
    root
  end

  def trace_path_back(last_node)
    res = [last_node]
    until res.first.parent.nil?
      current_node = res.first
      res.unshift(current_node.parent) unless current_node.parent.nil?
    end
    res.map { |node| node.value }
  end

  def find_path(loc)
    last_node = @root.dfs(loc)
    trace_path_back(last_node)
  end

end

k = KnightPathFinder.new([0,0])
p k.find_path([7,6])
