defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Club", "Hearts", "Diamonds"]

    # Cartesian projection N x M
    for suit <- suits, value <- values do
      "#{suit} of #{value}"
    end
  end

  # Returns a tuple => { *my_hand*, *rest* }
  #
  # iex(81)> {my_hand, rest} = Cards.deal(deck, 2)  ==> Pattern matching
  # With this syntax I destructure the resut of Deal
  #
  def deal(deck, number_of_cards) do
    Enum.split(deck, number_of_cards)
  end


  # https://hexdocs.pm/elixir/Enum.html#shuffle/1
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

  def contains?(deck, item) do
    Enum.member?(deck, item)
  end

end
