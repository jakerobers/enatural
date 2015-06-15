defmodule NgramTest do
  use ExUnit.Case
  import Enatural.Tokenizer


  test :transform_with_array do
    expected_murica = ["I", "love", "the", "United States of America"]
    murica = ["I", "love", "the", "United", "States", "of", "America"];
    training_set_murica = [{"United States of America", ["United", "States", "of", "America"]}, {"doctor", ["dr."]}]
    result_murica = transform(murica, training_set_murica);
    assert result_murica == expected_murica

    expected_create = ["create", "task", "for", "frontend", "bug", "on", "map"]
    create = ["Create", "me", "a", "task", "for", "frontend", "fixes", "on", "map"]
    training_set_create = [{"create", ["Create", "me", "a"]}, {"bug", ["fixes"]}]
    result_create = transform(create, training_set_create);
    assert result_create == expected_create
  end

  test :transform_with_string do
    expected_create = ["create", "task", "for", "frontend", "bug", "on", "map"]
    create = "Create me a task for frontend fixes on map"
    training_set_create = [{"create", ["Create", "me", "a"]}, {"bug", ["fixes"]}]
    result_create = transform(create, training_set_create);
    assert result_create == expected_create
  end
end
