defmodule GithubSearch.Display do
    import Scribe, only: [print: 1]

    def info({:error, error, _}) do
      print(%{"error" => error})
    end
    
    def info({:ok, info, :user}) do
      IO.inspect info
    end
end