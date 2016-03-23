require 'jruby-kafka/namespace'

class JrubyKafkaError < StandardError
  attr_reader :object

  def initialize(object)
    @object = object
  end
end