require('rspec')
require('pry')
require('word_definer')


describe("WordDefiner") do
  before() do
      WordDefiner.clear()
    end

describe("#save") do
    it("save a word to a list") do
      define = WordDefiner.new({"define_word" => "kitten", "word_meaning" => "a baby cat"})
      define.save()
      expect(WordDefiner.all()).to(eq([define]))
    end
  end

end
