require_relative 'questions_database'

class Shared

  def self.find_by_id(id)
    table_name = self.to_s.downcase + 's'
    sql_query = "SELECT * FROM #{table_name} WHERE id = ?"
    data = QuestionsDatabase.instance.execute(sql_query, id)
    data.map { |datum| self.new(datum) }.first
  end

  def self.all
    table_name = self.to_s.downcase + 's'
    sql_query = "SELECT * FROM #{table_name}"
    data = QuestionsDatabase.instance.execute(sql_query)
    data.map { |datum| self.new(datum) }
  end

  def self.items_by_hash(options)
    table_name = self.to_s.downcase + 's'
    conditions = []
    options.keys.each do |key|
      conditions << "#{key} = ?"
    end
    conditions = conditions.join(" AND ")
    sql_query = "SELECT * FROM #{table_name} WHERE "+conditions
    data = QuestionsDatabase.instance.execute(sql_query, *options.values)
    data.map { |datum| self.new(datum) }
  end

  def self.where(conditions)
    table_name = self.to_s.downcase + 's'
    sql_query = "SELECT * FROM #{table_name} WHERE "+conditions
    data = QuestionsDatabase.instance.execute(sql_query)
    data.map { |datum| self.new(datum) }
  end

  def initialize(vars, options)
    @vars = vars.map(&:to_sym).concat([:id])
    @id = options['id']
    vars.each do |varname|
      self.class.send(:attr_accessor, varname.to_sym)
      self.send("#{varname}=", options[varname])
    end
  end

  def save
    tname = self.class.to_s.downcase + 's'
    args = @vars.map { |var| self.send(var) }
    if !@id.nil?
      values = @vars[0..-2].map { |var| "#{var} = ?" }.join(', ')
      query = "UPDATE #{tname} SET #{values} WHERE id = ?"
    else
      col_names = @vars[0..-2].map(&:to_s).join(", ")
      args.pop
      values = (["?"]*args.length).join(', ')
      query = "INSERT INTO #{tname} (#{col_names}) VALUES (#{values})"
    end
    p query
    p args
    QuestionsDatabase.instance.execute(query, *args)
    @id ||= QuestionsDatabase.instance.last_insert_row_id
  end
end
