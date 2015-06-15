defmodule NgramTest do
  use ExUnit.Case
  import Enatural.Ngram

  test :bigram do
    # Fail boundary string
    result = bigram("one")
    expected = []
    assert result == expected

    # Minimum boundary string
    result = bigram("one two")
    expected = [["one", "two"]]
    assert result == expected

    # Normal use case string
    result = bigram("one two three four")
    expected = [["one", "two"], ["two", "three"], ["three", "four"]]
    assert result == expected

    # Normal use case list
    result = bigram(["one", "two", "three", "four"])
    expected = [["one", "two"], ["two", "three"], ["three", "four"]]
    assert result == expected
  end

  test :trigram do
    #Fail boundary

    # Normal use case string
    result = trigram("one two three four")
    expected = [["one", "two", "three"], ["two", "three", "four"]]
    assert result == expected
  end

  test :quadgram do
    # Normal use case string
    result = quadgram("one two three four five")
    expected = [["one", "two", "three", "four"], ["two", "three", "four", "five"]]
    assert result == expected
  end
end