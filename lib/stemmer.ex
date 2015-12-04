defmodule Enatural.Stemmer do

  @plural_regexes [{"ss", "sses$"}, {"i", "ies$"}, {"ss", "ss$"}, {"", "s$"}, {"", "'s$"}]
  @grammar_suffix_regexes [{"", "ing$"}, {"", "ed$"}, {"", "ful$"}, {"", "fully$"}, {"", "ment$"}, {"", "ion$"} ,{"", "ly$"}]

  @doc """
  Standard stemming that removes plurals and 's.

  iex> data = "Show me all of jakes and joes tasks"
  iex> stem_standard(data)
  ["Show", "me", "all", "of", "jake", "and", "joe", "task"]
  """
  def stem_plural(data) do
    stem(data, @plural_regexes, [])
  end

  def stem_grammar_suffix(data) do
    stem(data, @grammar_suffix_regexes, [])
  end

  @doc """
  iex> data = "Show me all of jakes and joes tasks"
  iex> regexes = [{"ss", "sses$"}, {"i", "ies$"}, {"ss", "ss$"}, {"", "s$"}]
  iex> stem(data, regexes)
  ["Show", "me", "all", "of", "jake", "and", "joe", "task"]
  """
  def stem(data, regexes, acc) when length(data) > 0 do
    [element | data] = data
    result = acc ++ stem_individual(element, regexes)
    stem(data, regexes, result)
  end

  def stem(data, regexes, acc) when is_binary(data) do
    stem(String.split(data), regexes, acc)
  end

  def stem(_, [], acc), do: acc
  def stem([], _, acc), do: acc
  def stem(_, _, _), do: nil

  def stem_individual(element, []), do: [element]
  def stem_individual(element, regexes) do
    [{replacement, regex} | regexes] = regexes
    {:ok, pattern} = Regex.compile(regex)
    if Regex.match?(pattern, element) do
      element = Regex.replace(pattern, element, replacement)
      stem_individual(element, [])
    else
      stem_individual(element, regexes)
    end
  end
end
