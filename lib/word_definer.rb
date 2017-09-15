class WordDefiner
  @@list = []
  attr_accessor :define_word, :word_meaning
  attr_reader :id

  def initialize(attributes)
    @define_word = attributes.fetch('define_word')
    @word_meaning = attributes.fetch('word_meaning')
    @id = @@list.length + 1
  end

  def self.all
    @@list
  end

  def save
    @@list.push(self)
  end

end
