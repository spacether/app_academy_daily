require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    conditions = params.keys.map { |k| "#{k} = ?" }.join(" AND ")
    query = <<-SQL
    SELECT
      *
    FROM
      #{self.table_name}
    WHERE
      #{conditions}
    SQL
    res = DBConnection.execute(query, *params.values)
    self.parse_all(res)
  end
end

class SQLObject
  extend Searchable
end
