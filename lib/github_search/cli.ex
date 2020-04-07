defmodule GithubSearch.CLI do
  @moduledoc """
  GithubSearch CLI is a command line to get info of github.
  """

  def main(args \\ []) do
    options = [switches: [file: :string], aliases: [f: :file]]
    {opts,_,_}= OptionParser.parse(args, options)
    
    IO.inspect opts, label: "Command Line Arguments"
  end
end