defmodule StemTest do
  use ExUnit.Case
  import Enatural.Stemmer

  test :normal_stemmer do
    expected = ["Show", "me", "all", "of", "jake", "and", "joe", "task"]
    data = "Show me all of jakes and joes tasks"
    assert stem_standard(data) == expected
  end
end
