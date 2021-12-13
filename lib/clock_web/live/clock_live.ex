defmodule ClockWeb.ClockLive do
  use ClockWeb, :live_view

  # temporizador
  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick)
    end

    socket = assign_current_time(socket)
    {:ok, socket}
  end

  # renderiza o conteudo
  def render(assigns) do
    ~L"""
      <h1> <%= @now %> </h1>
    """
  end

  # ele é chamado pelo temporizador a cada 1 segundo
  def handle_info(:tick, socket) do
    socket = assign_current_time(socket)

    {:noreply, socket}
  end

  # atualização do servidor
  def assign_current_time(socket) do
    now =
      Time.utc_now() # retorna a hora atual do servidor
      |> Time.to_string()
      |> String.split(".") # Este pipeline é usado para que a hora seja exibida sem os milissegundos.
      |> hd

    assign(socket, now: now)
  end
end
