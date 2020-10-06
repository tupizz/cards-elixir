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


## Returns a tuple => { *my_hand*, *rest* }
  
```elixir
  iex(81)> {my_hand, rest} = Cards.deal(deck, 2)  ==> Pattern matching
   With this syntax I destructure the resut of Deal
```  

# Installing third paty modules

```elixir
  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.12"}
    ]
  end
```

```bash
mix deps.get

```

## Generate documentation of my files

```bash
mix docs
```

## WTF!!! No elixir se vc faz um doc e utiliza `doctest Cards` por exemplo ele vai testar sua DOC

```elixir
  @doc """
    Receive a deck and a numver of cards to deal

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, restDeck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  
  """
  def deal(deck, number_of_cards) do
    Enum.split(deck, number_of_cards)
  end
```