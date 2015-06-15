defmodule Enatural.Ngram do

@doc """
A tool to generate a collection of ngrams: http://en.wikipedia.org/wiki/N-gram
"""

  @doc """
  An ngram that produces 1 word length lists.

  iex> unigram("Produces a unigram")
  iex> [["Produces"], ["a"], ["unigram"]]

  iex> sequence = ["Produces", "a", "unigram"]
  iex> unigram(sequence)
  iex> [["produces"], ["a"], ["unigram"]]
  """
  def unigram(sequence) do
    ngram(sequence, 1)
  end


  @doc """
  An ngram that produces 2 word length lists.

  iex> bigram("one two three four")
  iex> [["one", "two"], ["two", "three"], ["three", "four"]]
  """
  def bigram(sequence) do
    ngram(sequence, 2)
  end


  @doc """
  An ngram that produces 3 word length lists.

  iex> trigram("one two three four")
  iex> [["one", "two", "three"], ["two", "three", "four"]]
  """
  def trigram(sequence) do
    ngram(sequence, 3)
  end


  @doc """
  An ngram that produces 4 word length lists.

  iex> quadgram("one two three four five")
  iex> [["one", "two", "three", "four"], ["two", "three", "four", "five"]]
  """
  def quadgram(sequence) do
    ngram(sequence, 4)
  end


  @doc """
  Converts a string, or list of words and creates an ngram.

  iex> ngram("one two three four", 2)
  iex> [["one", "two"], ["two", "three"], ["three", "four"]]

  iex> ngram(["one", "two", "three", "four"], 2)
  iex> [["one", "two"], ["two", "three"], ["three", "four"]]
  """
  def ngram(sequence, n) when is_list(sequence), do: process_ngram(sequence, n, [])
  def ngram(sequence, n) when is_binary(sequence), do: process_ngram(String.split(sequence, " "), n, [])
  def ngram(nil, n), do: raise "Invalid argument nil, #{n}"
  def ngram(n, nil), do: raise "Invalid argument #{n}, nil"
  def ngram(nil, nil), do: raise "Invalid argument nil, nil"

  @doc """
  A recursive algorithm to copy [sequence..sequence+n], into the accumulated.
  It will remove the first item in the sequence for each iteration.
  """
  def process_ngram(sequence, n, accumulated) when length(sequence)-n > 0 do
    [h|_] = Enum.chunk sequence, n
    first_removed = Enum.drop sequence, 1
    process_ngram first_removed, n, accumulated ++ [h]
  end

  def process_ngram(sequence, n, accumulated) when length(sequence)-n == 0, do: accumulated ++ [sequence]
  def process_ngram(_, _, _), do: []

end