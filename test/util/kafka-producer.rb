require 'jruby-kafka'

KAFKA_PRODUCER_OPTIONS = {
    :bootstrap_servers => '127.0.0.1:9092',
    :key_serializer => 'org.apache.kafka.common.serialization.StringSerializer',
    :value_serializer => 'org.apache.kafka.common.serialization.StringSerializer',
}

def send_kafka_producer_msg(topic = 'test')
  producer = JrubyKafka::KafkaProducer.new(KAFKA_PRODUCER_OPTIONS)
  producer.connect
  producer.send_msg(topic,nil, nil, 'test message')
end

def send_kafka_producer_msg_cb(&block)
  producer = JrubyKafka::KafkaProducer.new(KAFKA_PRODUCER_OPTIONS)
  producer.connect
  producer.send_msg('test',nil, nil, 'test message', &block)
end
