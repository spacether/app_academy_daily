class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |var|
      atted = "@#{var}".to_sym
      var = var.to_sym
      # reader
      define_method(var) { instance_variable_get(atted) }
      # writer
      define_method("#{var}=") { |val| instance_variable_set(atted, val) }
    end

  end

end
