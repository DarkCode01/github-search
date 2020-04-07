defmodule GithubSearchTest do
  use ExUnit.Case
  doctest GithubSearch

  test "Test error message (Not Found 404)." do
    result = GithubSearch.process_parser([username: "nothing_to_foundndnd"])
    assert result == {:error, "Username not found or invalid, :(", :user}
  end

  test "Test get all data by username." do
    {status, data, type} = GithubSearch.process_parser([username: "darkcode01"])

    assert status == :ok
    assert type == :user
    assert is_map data
  end
end
