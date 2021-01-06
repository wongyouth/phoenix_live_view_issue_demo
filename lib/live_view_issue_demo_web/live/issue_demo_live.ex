defmodule LiveViewIssueDemoWeb.IssueDemoLive do
  use LiveViewIssueDemoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  @impl true
  def render(assigns) do
    ~L"""
      <form phx-hook="Mount" id="form-<%= @count %>">
        <input type="text" name="id" value="<%= @count %>">
        <button>Save</button>
      </form>

      <button phx-click='reset'>Reset</button>
    """
  end

  @impl true
  def handle_event("reset", _params, socket) do
    {:noreply, assign(socket, count: socket.assigns.count + 1)}
  end
end
