class WordDefiner
  @@list = []
  attr_accessor :define_word, :word_meaning
  attr_reader :id

  def initialize(attributes)
    @define_word = attributes.fetch('define_word')
    @word_meaning = [attributes.fetch('word_meaning')]
    @id = @@list.length + 1

  end

  def self.find(id)
    define_id = id.to_i()
    @@list.each do |word|
      if word.id == define_id
        return word
      end
    end
  end

  def self.remove_word(id)
    @@list.map do |word|
      if word.id == id
        word.define_word = ""
        word.word_meaning = []
      end
    end
  end

  def self.update(new_definition,id)
    @@list.map do |word|
      if word.id == id
        word.word_meaning.push(new_definition)
      end
    end
  end

  def self.all
    @@list
  end

  def save
    @@list.push(self)
  end

  def self.sort
    @@list.sort_by! {|define| define.define_word}
  end

  def self.clear()
    @@list = []
  end

end
