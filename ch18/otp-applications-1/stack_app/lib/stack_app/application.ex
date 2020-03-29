defmodule StackApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    StackApp.ApplicationSupervisor.start_link(name: ApplicationSupervisor)
  end
end
