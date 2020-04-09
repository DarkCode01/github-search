defmodule GithubSearch.CLI do
  @moduledoc """
  GithubSearch CLI is a command line to get info of github.
  """

  def main(args \\ []) do
    options = [strict: [username: :string, project: :string]]
    {opts ,_ ,_ } = OptionParser.parse(args, options)

    GithubSearch.process_parser(opts)
    |> GithubSearch.parser_user_info
    |> GithubSearch.Display.info
  end
end