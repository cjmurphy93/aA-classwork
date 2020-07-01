require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
   @arr ||= DBConnection.execute2(<<-SQL)
      SELECT
      *
      FROM
      '#{self.table_name}'
      
    SQL

    @arr[0].map {|ele| ele.to_sym}
  end

  def self.finalize!

    self.columns.each do |col|
      define_method(col) do
        @attributes[col]
      end
      define_method("#{col}=") do |val|
      self.attributes
      @attributes[col] = val
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table = table_name
  end

  def self.table_name
    # ...
   @table ||= "#{self}".tableize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
    SQLObject.table_name = "#{self.class}".tableize
    SQLObject.finalize!
    cols = SQLObject.columns
    params.each do |attr_name, val|
      a_sym = attr_name.to_sym
      if !cols.include?(a_sym)
        raise "unknown attribute '#{a_sym}'"
      else
        self.send("#{a_sym}=", val)

      end
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  # def method_missing(*args)

  # end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
