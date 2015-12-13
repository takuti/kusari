require "kusari/markov_sentence_generator"
require "kusari/version"

module Kusari
  class Generator
    def initialize(gram=3, ipadic_path="./ipadic")
      @generator = MarkovSentenceGenerator.new([2, gram].max, ipadic_path)
    end

    def add_string(string)
      @generator.add(string)
    end

    def generate(limit)
      @generator.generate(limit)
    end

    def load(path)
      @generator.load_table(path)
    end

    def save(path)
      @generator.save_table(path)
    end
  end
end
