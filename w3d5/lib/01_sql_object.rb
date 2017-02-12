require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.
class SQLObject

  def self.columns
    query = <<-SQL
    SELECT
      *
    FROM
      #{self.table_name}
    LIMIT 0
    SQL
    @cols ||=  DBConnection.execute2(query).first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |c|
      define_method("#{c}=") { |val| self.attributes[c] = val }
      define_method(c) { self.attributes[c] }
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.tableize
  end

  def self.all
    query = <<-SQL
    SELECT
      #{self.table_name}.*
    FROM
      #{self.table_name}
    SQL
    res = DBConnection.execute(query)
    self.parse_all(res)
  end

  def self.parse_all(results)
    results.map { |item_hash| self.new(item_hash) }
  end

  def self.find(id)
    query = <<-SQL
    SELECT
      *
    FROM
      #{self.table_name}
    WHERE
      id = #{id}
    LIMIT 1
    SQL
    res = DBConnection.execute(query).first
    return res if res.nil?
    self.new(res)
  end

  def initialize(params = {})
    self.class.columns
    self.class.finalize!
    params.each do |attr_name, val|
      attr_name = attr_name.to_sym
      valid = self.class.columns.include?(attr_name)
      raise "unknown attribute '#{attr_name}'" if !valid
      assigner = "#{attr_name}="
      self.send(assigner, val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    columns = self.class.columns.dup
    columns.delete(:id)
    colstr = columns.map(&:to_s).join(", ")
    qmarks = (["?"] * columns.size).join(", ")
    vals = columns.map { |key| self.send(key) }
    query = <<-SQL
    INSERT INTO
      #{self.class.table_name} (#{colstr})
    VALUES
      (#{qmarks})
    SQL
    DBConnection.execute(query, *vals)
    id = DBConnection.last_insert_row_id
    self.send(:id=, id)
    id
  end

  def update
    columns = self.class.columns.dup
    columns.delete(:id)
    colstr = columns.map { |var| "#{var} = ?" }.join(", ")
    columns << :id
    vals = columns.map { |key| self.send(key) }
    query = <<-SQL
    UPDATE
      #{self.class.table_name}
    SET
      #{colstr}
    WHERE
      id = ?
    SQL
    DBConnection.execute(query, *vals)
  end

  def save
    self.send(:id).nil? ? insert : update
  end
end
