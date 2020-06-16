class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    # if names.length == 1
    #   define_method('names[0]') do
    #     self.instance_variable_get("#{names[0]}")
    #   end
    # elsif names.length == 2
    #   define_method(names[0]) do
    #     self.instance_variable_set("#{names[0]}", "#{names[1]}")
    #   end

    #   end
    names.each do |name|
      define_method(name) do
        self.instance_variable_get("@#{name}")
      end
      define_method("#{name}=") do |val|
        self.instance_variable_set("@#{name}", val)
      end
    end
  end
end
