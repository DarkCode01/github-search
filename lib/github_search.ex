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
  require HTTPoison
  import Poison, only: [decode!: 1]


  def process_parser([username: username]), do: get_user_info(username)
  def process_parser([project: project]), do: {:ok, project}

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

  defp request_get(username), do: HTTPoison.get "https://api.github.com/users/#{username}"
end
