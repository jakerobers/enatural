# enatural
ENatural is a library that provides a number of natural language processing tools to assist in analyzing and parsing NLP data.

## Features

### Ngram

The Ngram tool is used to produce a structure of data for analyzing word succession. The supported functions are:

	iex> Ngram.unigram("Produces a unigram")
	iex> [["Produces"], ["a"], ["unigram"]]

You can also provide any of the functions with a list:

	iex> unigram(["Produces", "a", "unigram"])
	iex> [["produces"], ["a"], ["unigram"]]

Other functions are:

	iex> Ngram.bigram("one two three four")
	iex> [["one", "two"], ["two", "three"], ["three", "four"]]

	iex> Ngram.trigram("one two three four")
	iex> [["one", "two", "three"], ["two", "three", "four"]]

	iex> Ngram.quadgram("one two three four five")
	iex> [["one", "two", "three", "four"], ["two", "three", "four", "five"]]

	iex> ngram("one two three four", 2)
	iex> [["one", "two"], ["two", "three"], ["three", "four"]]

### Tokenizer

The tokenizer is useful for recognizing string patterns and replacing them with generic counterparts to make frequency analysis and decision trees easier. Similar to Ngram, the transform method also accepts a string for the first argument.

	iex> data = ["I", "love", "the", "United", "States", "of", "America"]
	iex> training_set = [{"United States of America", ["United", "States", "of", "America"]}, {"doctor", ["dr."]}]
	iex> transform(data, training_set)
	iex> ["I", "love", "the", "United States of America"]

Notice "United States of America" as its own index in the array.

## Stemmer

The stemmer removes unwanted patterns. A custom list of regexes can be provided, otherwise the standard stemmer can be used to convert plural or posessive nouns into their singular counterparts.

	iex> data = "Show me all of jakes and joes tasks"
 	iex> stem_standard(data)
 	["Show", "me", "all", "of", "jake", "and", "joe", "task"]

 	iex> data = "Show me all of jakes and joes tasks"
 	iex> regexes = [{"ss", "sses$"}, {"i", "ies$"}, {"ss", "ss$"}, {"", "s$"}]
 	iex> stem(data, regexes)
 	["Show", "me", "all", "of", "jake", "and", "joe", "task"]

## Prospective Features
### - Normalizer
### - Bayes Theorem
### - FileIO for dictionaries and training data
### - Word Frequencies
### - Entropy

