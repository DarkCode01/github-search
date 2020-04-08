defmodule GithubSearch.Display do
    import Scribe, only: [print: 1]

    def info({:error, error, _}) do
      print(%{"error" => error})
    end
    
    def info({:ok, info, :user}) do
      print(%{
        "username" => Map.get(info, "login"),
        "Name" => Map.get(info, "name"),
        "Bio" => Map.get(info, "bio"),
        "Followers" => Map.get(info, "followers"),
        "Following" => Map.get(info, "following")
      })
    end
end