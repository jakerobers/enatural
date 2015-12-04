defmodule Enatural.Tokenizer do

@doc """
http://en.wikipedia.org/wiki/Tokenization_(lexical_analysis)

Definition: In lexical analysis, tokenization is the process of breaking a stream of
text up into words, phrases, symbols, or other meaningful elements called tokens.

The training set should already be provided. Best practice is to store this
information in a database. It is expected that the data-to-be-processed was
already split by using String.split/1 or an equivelent.
"""

  @doc """
  Masks an ngram based on tokens.

  iex> data = ["I", "love", "the", "United", "States", "of", "America"]
  iex> training_set = [{"United States of America", ["United", "States", "of", "America"]}, {"dr.", ["doctor"]}]
  iex> transform(data, training_set)
  iex> ["I", "love", "the", "United States of America"]
  """
  def transform(data, training_set) when is_binary(data) do
    transform(String.split(data), training_set)
  end

  def transform(data, training_set) when is_list(data) do
    apply_sets_on_data(0, data, training_set)
  end

  def apply_sets_on_data(data_index, data, _) when data_index >= length(data), do: data
  def apply_sets_on_data(data_index, data, training_set) when data_index < length(data) do
    data = apply_set(0, data_index, data, training_set) #iterates through all training sets
    apply_sets_on_data(data_index+1, data, training_set)
  end

  def apply_set(_, _, data, []), do: data
  def apply_set(set_index, data_index, data, training_set) when length(training_set) > 0 do
    [{replacement, set_value} | training_set] = training_set
    data_in_question = Enum.slice(data, data_index, length(set_value))

    if data_in_question == set_value do
      data = replace_indecies(data, data_index, length(set_value), replacement, 0)
    end

    apply_set(set_index+1, data_index, data, training_set)
  end

  def replace_indecies(list, starting, num_of_indecies, replacement, current) when current < num_of_indecies do
    list = List.delete_at(list, starting)
    replace_indecies(list, starting, num_of_indecies, replacement, current+1)
  end

  def replace_indecies(list, starting, num_of_indecies, replacement, current) when current >= num_of_indecies do
    List.insert_at(list, starting, replacement)
  end
end
