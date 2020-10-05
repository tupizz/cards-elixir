# Cards

Card simulator with elixir

## Commands examples

mix new cards

iex -S mix

recompile

iex(2)> Cards.shuffle ["teste", "outro"] 
["teste", "outro"]

iex(3)> Cards.shuffle["teste", "outro"]  
** (SyntaxError) iex:3: syntax error before: "outro"

iex(3)> Cards.shuffle(["teste", "outro"]) 
["teste", "outro"]


## Como funciona Elixir por debaixo dos panos?

Código elixir
  => Elixir builda
  => É transpilado para ERLANG 
  => É compilado e executado por BEAM (Erlang virtual machine)