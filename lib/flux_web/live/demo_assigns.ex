defmodule FluxWeb.LiveDemoAssigns do
  @moduledoc """
  Assigns the current demo state.
  """

  import Phoenix.Component
  import Phoenix.LiveView

  def on_mount(:default, _params, _session, socket) do
    socket = attach_hook(socket, :active_tab, :handle_params, &set_active_demo/3)
    {:cont, socket}
  end

  defp set_active_demo(_params, _url, socket) do
    demo =
      case {socket.view, socket.assigns.live_action} do
        {FluxWeb.LiveCounter, _} ->
          :counter

        {FluxWeb.LiveLogList, _} ->
          :log_list

        {FluxWeb.LiveFlashSonner, _} ->
          :flash_sonner

        {FluxWeb.LiveSSR, _} ->
          :ssr

        {FluxWeb.LiveHybridForm, _} ->
          :hybrid_form

        {FluxWeb.LiveSlot, _} ->
          :slot

        {FluxWeb.LiveContext, _} ->
          :context

        {_view, _live_action} ->
          nil
      end

    {:cont, assign(socket, demo: demo)}
  end
end
