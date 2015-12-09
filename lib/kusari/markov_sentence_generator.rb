# coding: utf-8

require "igo-ruby"

class MarkovSentenceGenerator
  HEAD = "[HEAD]"
  TAIL = "[TAIL]"

  def initialize(gram=3, ipadic_path="./ipadic")
    @gram = gram

    # Japanese tokenizer
    @tagger = Igo::Tagger.new(ipadic_path)

    # save arrays of tokenized words based on the N-gram model
    @markov_table = Array.new
  end

  def tokenize(string)
    tokens = Array.new
    tokens << HEAD
    tokens += @tagger.wakati(string)
    tokens << TAIL
  end

  def add(string)
    tokens = tokenize(string)

    # if there are at least 4 tokens, we can create both of HEAD-started and TAIL-ended array of words
    return if tokens.size < 4

    # update markov_table
    i = 0
    loop do
      @markov_table << tokens[i..(i+@gram-1)]
      break if tokens[i+@gram-1] == TAIL
      i += 1
    end
  end

  def generate(limit)
    # select all HEAD-started arrays
    head_arrays = Array.new
    @markov_table.each do |markov_array|
      if markov_array[0] == HEAD
        head_arrays << markov_array
      end
    end

    # sample one HEAD-started array and create initial sentence based on that
    sampled_array = head_arrays.sample
    sentence = sampled_array[1] + sampled_array[2]

    # start Markov chain until getting the TAIL flag
    loop do
      # select all arrays which can chain their head word to current tail of the sentence
      chain_arrays = Array.new
      @markov_table.each do |markov_array|
        if markov_array[0] == sampled_array[2]
          chain_arrays << markov_array
        end
      end

      # finish here if we cannot continue to chain
      break if chain_arrays.length == 0

      # grow current sentence and check if it has the TAIL flag
      sampled_array = chain_arrays.sample
      if sampled_array[2] == TAIL
        sentence += sampled_array[1]
        break
      else
        concat_string = sampled_array[1] + sampled_array[2]
        break if sentence.length + concat_string.length > limit
        sentence += concat_string
      end
    end
    sentence
  end
end
