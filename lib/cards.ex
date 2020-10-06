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
      iex> contains = Cards.contains? deck, "Ace of Spades"
      iex> contains
      true
  
  """
  def contains?(deck, item) do
    Enum.member?(deck, item)
  end

end
