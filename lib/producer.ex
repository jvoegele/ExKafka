defmodule Kafka.Producer do
  use GenServer

  def init([host, port]) do
    {:ok, _conn} = :gen_tcp.connect(host, port, [:binary, {:packet, 0}])
  end

  def start_link([host, port]) do
    GenServer.start_link(__MODULE__, [host, port])
  end

  def send_kafka_message(message) do
    GenServer.call(__MODULE__,{:send_kafka_message, message})
  end

  def handle_call({:send_kafka_message, message}) do
    #IO.inspect(conn)
    #message = :gen_tcp.send(conn, message)
    {:reply, message, message}
  end
end
