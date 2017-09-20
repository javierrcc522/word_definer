require('rspec')
require('pry')
require('word_definer')


describe("WordDefiner") do
  before() do
      WordDefiner.clear()
    end

  describe("#save") do
      it("save a word to a list") do
        word = WordDefiner.new({"define_word" => "kitten", "word_meaning" => "a baby cat"})
        word.save()
        expect(WordDefiner.all()).to(eq([word]))
    end
  end

  describe(".remove_word") do
  it(" will delete a word and its definition") do
    word = WordDefiner.new({"define_word" => "kitten", "word_meaning" => "a baby cat"})
    word.save()
    WordDefiner.remove_word(word.id)
    expect(word.define_word).to(eq(""))
    end
  end

  describe(".sort") do
  it("puts the words in alphabetical order") do
    word = WordDefiner.new({"define_word" => "kitten", "word_meaning" => "a baby cat"})
    word.save()
    word2 = WordDefiner.new({"define_word" => "zetta", "word_meaning" => "the last letter word in spanish"})
    word2.save()
    expect(WordDefiner.sort()).to(eq([word,word2]))
    end
  end

  describe('#clear') do
    it("clears items from the dictionary") do
      word = WordDefiner.new({"define_word" => "zetta", "word_meaning" => "the last letter word in spanish"})
      word.save()
      WordDefiner.clear()
      expect(WordDefiner.all).to(eq([]))
    end
  end

  describe('#all') do
    it('show all the items in the list') do
      word = WordDefiner.new({"define_word" => "kitten", "word_meaning" => "a baby cat"})
      word.save()
      expect(WordDefiner.all).to(eq([word]))
    end
  end
end
