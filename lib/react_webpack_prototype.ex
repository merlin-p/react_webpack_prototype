defmodule ReactWebpackPrototype do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      supervisor(ReactWebpackPrototype.Endpoint, []),
      # Start the Ecto repository
      supervisor(ReactWebpackPrototype.Repo, []),
      # Here you could define other workers and supervisors as children
      # worker(ReactWebpackPrototype.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ReactWebpackPrototype.Supervisor]

    # thanks to https://github.com/bitwalker/exrm/issues/67#issuecomment-182818363
    res = Supervisor.start_link(children, opts)

    path_to_migrations =
      case Mix.env do
        :dev  -> "priv/repo/migrations"
        _     -> "/home/deploy/phoenix-react-playground/priv/repo/migrations"
      end
    IO.puts "######### run migrations..."
    Ecto.Migrator.run(ReactWebpackPrototype.Repo, path_to_migrations, :up, all: true)

    res
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ReactWebpackPrototype.Endpoint.config_change(changed, removed)
    :ok
  end
end
