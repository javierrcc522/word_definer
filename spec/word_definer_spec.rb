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

  describe(".remove_word") do
  it(" will delete a word and its definition") do
    define = WordDefiner.new({"define_word" => "kitten", "word_meaning" => "a baby cat"})
    define.save()
    WordDefiner.remove_word(define.id)
    expect(define.define_word).to(eq(""))
    end
  end

  describe(".sort") do
  it("puts the words in alphabetical order") do
    word1 = WordDefiner.new({"define_word" => "kitten", "word_meaning" => "a baby cat"})
    word1.save()
    word2 = WordDefiner.new({"define_word" => "kitten", "word_meaning" => "a baby cat"})
    word2.save()
    WordDefiner.sort()
    expect(WordDefiner.all()).to(eq([word1,word2]))
    end
  end




end
