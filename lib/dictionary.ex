defmodule Enatural.Dictionary do

  use File
  @filename "nlp_dictionary.txt"

  def load(filename) when is_binary(filename) and length(filename) > 0 do
    File.read(filename)
  end

  def load(_) do
    File.read(@filename)
  end

  def save(filename, content, append) when append == true do
    File.write(filename, content, )
  end

  def save(filename, content, _) do
    File.write(filename, content, )
  end

  def save(_, _), do: # throw error

end