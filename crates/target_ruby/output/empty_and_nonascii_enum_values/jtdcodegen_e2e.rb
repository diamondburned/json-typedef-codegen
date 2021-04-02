# Code generated by jtd-codegen for Ruby v0.1.0

require 'json'
require 'time'

module JTDCodegenE2E

  class Root
    attr_accessor :value

    def initialize(value)
      self.value = value
    end

    private_class_method :new

    DEFAULT_NAME = new("")
    FOO = new("$foo")
    FOO0 = new("0foo")
    FOO1 = new("_foo")
    FOO_BAR = new("foo\nbar")
    FOO_BAR0 = new("foo bar")
    FOO0BAR = new("foo0bar")
    FOO_BAR1 = new("foo﷽bar")

    def self.from_json_data(data)
      {
        "" => DEFAULT_NAME,
        "$foo" => FOO,
        "0foo" => FOO0,
        "_foo" => FOO1,
        "foo\nbar" => FOO_BAR,
        "foo bar" => FOO_BAR0,
        "foo0bar" => FOO0BAR,
        "foo﷽bar" => FOO_BAR1,
      }[data]
    end

    def to_json_data
      value
    end
  end

  private

  def self.from_json_data(type, data)
    if data.nil? || [Object, TrueClass, Integer, Float, String].include?(type)
      data
    elsif type == DateTime
      DateTime.rfc3339(data)
    elsif type.is_a?(Array)
      data.map { |elem| from_json_data(type.first, elem) }
    elsif type.is_a?(Hash)
      data.transform_values { |elem| from_json_data(type.values.first, elem) }
    else
      type.from_json_data(data)
    end
  end

  def self.to_json_data(data)
    if data.nil? || [TrueClass, FalseClass, Integer, Float, String].include?(data.class)
      data
    elsif data.is_a?(DateTime)
      data.rfc3339
    elsif data.is_a?(Array)
      data.map { |elem| to_json_data(elem) }
    elsif data.is_a?(Hash)
      data.transform_values { |elem| to_json_data(elem) }
    else
      data.to_json_data
    end
  end
end