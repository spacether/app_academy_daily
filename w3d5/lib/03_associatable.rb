require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    @class_name.underscore+"s"
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @class_name = name
    default = {}
    default[:primary_key] = :id
    default[:foreign_key] = "#{name}_id".to_sym
    default[:class_name] = name.to_s.camelcase
    options = default.merge(options)
    options.each do |var, value|
      self.send("#{var}=", value)
    end
  end

end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    default = {}
    default[:foreign_key] = (self_class_name.underscore + "_id").to_sym
    default[:class_name] = name.singularize.camelcase
    default[:primary_key] = :id
    options = default.merge(options)
    options.each do |var, value|
      self.send("#{var}=", value)
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name) do
      fkey = self.send(options.foreign_key)
      options.model_class.where(id: fkey).first
    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Searchable
  extend Associatable
end
