defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Create a cartesian combination of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Club", "Hearts", "Diamonds"]

    # Cartesian projection N x M
    for value <- values, suit <- suits  do
      "#{value} of #{suit}"
    end
  end

  def working_with_lists do 
    #  keyword list
    colors = [{:user, "tupizz"}, {:primary, "morris"}]
    colors[:primary]
  end

  def create_object_deck do 
    {hand, rest} = Cards.create_deck
                |> Cards.shuffle
                |> Cards.deal(3)

    # Se a chave for um :Atom então usa-se 
    # a notação key: value, caso contrário, key => value
    map = %{ "handed" => hand, "rested" => rest, a: 1, b: 2}
    colors = %{ primary: "red" } # imutabilidade
    colors_new = Map.put(colors, :primary, "blue")
    colors_new_other_syntax = %{ colors | primary: "blue" }

    # map.hand --> nao consigo acessar assim, pq não é um atom, então acesso por:  map["hand"]
    # map.a --> consigo acessar pq é um atom

    # de dentro de map pego handed e atribuo a hand
    %{ "handed" => hand_return } = map 

    Map.put(colors, :secondary_color, "green")
  end

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

  @doc """
    Create a hand given number of cards(`hand_size`) you want in a hand
  """
  def create_hand(hand_size) do
    {hand,_} = Cards.create_deck
                |> Cards.shuffle
                # o hand size é como segundo argumento, o primeiro é o retorno do shuffle
                |> Cards.deal(hand_size)

    hand
  end

  @doc """
    Create a cartesian combination of cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  # def load(filename) do
  #   {status, binary} = File.read(filename)
  #   case status do
  #     :ok -> :erlang.binary_to_term binary
  #     :error -> "That file does not exist"
  #   end
  # end

  def load(filename) do
    # Symbol in this case will works like a comparation of strings
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _} -> "That file does not exist"
    end
  end

  @doc """
    Determines whether a deck contains a given cards

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains? deck, "Ace of Spades"
      true
  
  """
  def contains?(deck, item) do
    Enum.member?(deck, item)
  end

end
