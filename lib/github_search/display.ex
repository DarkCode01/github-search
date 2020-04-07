defmodule GithubSearch.Display do
    def display_info({:error, error, _}), do: IO.inspect "Error #{error}"
    def display_info({:ok, info, :user}), do: IO.inspect info
    # def display_info({:ok, info}, :project), do: IO.inspect info
end