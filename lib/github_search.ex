defmodule GithubSearch do
  @moduledoc """
  Documentation for GithubSearch.
  """

  @doc """
  GithubSearch.process_parser

  ## Examples

      iex> {:ok, _, :user} = GithubSearch.process_parser([username: "darkcode01"])
      iex> GithubSearch.process_parser([username: "darkcode01_not_founw"])
      {:error, "Username not found or invalid, :(", :user}

  """
  @format [
    bar_color: [IO.ANSI.green_background],
    blank_color: [IO.ANSI.red_background],
    bar: " ",
    blank: " ",
    left: " ",
    right: " ",
  ]
  
  defstruct [
    :login,
    :name,
    :bio,
    :followers,
    :following
  ]

  require HTTPoison
  import Poison, only: [decode!: 1]

  defimpl Inspect, for: GithubSearch do
    def inspect(data, _) do
      """

        [#{data.login}] - #{data.name}
        
        #{data.bio}

        Followers: (#{data.followers}) - Following: (#{data.following})
        
      """
    end
  end

  def process_parser([username: username]) do
    get_user_info(username)
  end
  
  def process_parser([project: project]) do
    {:ok, project}
  end

  def get_user_info(username) do
    case request_get(username) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, decode!(body), :user}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        get_user_info(username, "Username not found or invalid, :(")
      {:error, %HTTPoison.Error{reason: reason}} ->
        get_user_info(username, reason)
    end
  end
  
  def get_user_info(_, msg) do
    {:error, msg, :user}
  end

  def parser_user_info({:error, msg, type}) do
    {:error, msg, type}
  end

  def parser_user_info({:ok, info, :user}) do
    user = %GithubSearch{
      login: Map.get(info, "login"),
      name: Map.get(info, "name"),
      bio: Map.get(info, "bio"),
      followers: Map.get(info, "followers"),
      following: Map.get(info, "following")
    }

    {:ok, user, :user}
  end

  def request_get(username) do
    # IO.inspect "Connected with github API v3..."
    result = Task.async(HTTPoison, :get, ["https://api.github.com/users/#{username}"])

    # Progress bar
    progress([0, 100])
    Task.await(result)
  end

  def progress([100, 100]) do
    ProgressBar.render(100, 100, @format)
  end
  def progress([current, 100]) do
    ProgressBar.render(current, 100, @format)
    :timer.sleep(10)

    progress([current + 1, 100])
  end
end
