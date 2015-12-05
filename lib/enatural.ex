defmodule Enatural do

  @doc """
    frequency("apple a day keeps a doctor away.")

    iex> %{
      a: 2,
      apple: 1,
      away: 1,
      day: 1,
      doctor: 1,
      keeps: 1,
    }
  """
  def frequency(sample), do: frequency(sample, %{})
  def frequency([], acc), do: acc
  def frequency(sample, acc) when is_binary(sample), do: frequency(String.split(sample, " "), acc)
  def frequency(sample, acc) when is_list(sample) do
    [head | tail] = sample

    if Map.has_key? acc, head do
      acc = Map.put acc, head, Map.get(acc, head)+1
    else
      acc = Map.put acc, head, 1
    end

    frequency(tail,acc)
  end
  def frequency(_, _) do
    raise "Invalid argument in frequency/2"
  end
end
