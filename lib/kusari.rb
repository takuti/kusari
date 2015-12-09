require "kusari/markov_sentence_generator"
require "kusari/version"

module Kusari
  class Generator
    def initialize(gram=3, ipadic_path="./ipadic")
      @generator = MarkovSentenceGenerator.new(gram, ipadic_path)
    end

    def add_string(string)
      @generator.add(string)
    end

    def generate(limit)
      @generator.generate(limit)
    end
  end
end
