defmodule Todo.Server do

  def init(_) do
    {:ok, HashDict.new}
  end

  def handle_call({:get, key}, _, state) do
    {:reply, HashDict.get(state, key), state}
  end

  def handle_cast({:put, key, value}, state) do
    {:noreply, HashDict.put(state, key, value)}
  end

  def start do
    GenServer.start(Todo.Server, nil)
  end

  def get(server_pid, key) do
    GenServer.call(server_pid, {:get, key})
  end

  def put(server_pid, key, value) do
    GenServer.cast(server_pid, {:put, key, value})
  end

end
