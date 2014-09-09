defmodule ProducerTest do
  use ExUnit.Case

  test "connecting a producer" do
    assert {:ok, _consumer_pid } = Kafka.ProducerSupervisor.connect()
  end

  test "putting something into kafka" do
    assert {:ok, _acknowledgement} = Kafka.Producer.send_kafka_message("a message")
  end
end
