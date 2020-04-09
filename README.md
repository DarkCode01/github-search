# Github Search ⚙️🌍
![Test](https://github.com/DarkCode01/github-search/workflows/Github%20Search%20-%20Elixir%20CI/badge.svg)

Package to get information of a github's user, this package is a practice to get more experience working with `Elixir`.

## Installation

This package is not published on [Hex](https://hex.pm/docs/publish) but ypu can `clone` the repository and run local.

Clone the repository:

```shell
git clone https://github.com/DarkCode01/github-search.git
cd ./github-search
```

Install all packages
```shell
mix deps.get
```

### Usage

And build project and run command.
```shell
mix escript.build
```

Run command to get information.
```shell
github_search --username darkcode01
```

Add to module and use.
```elixir
defmodule MyModule do
  import GithubSearch, only: [process_parser: 1]

  def my_function() do
    process_parser([username: "darkcode01"])
    |> IO.inspect
    |> Map.get("login")
  end
end
```


<center>Made with ♥️ by darkcoder</center> 