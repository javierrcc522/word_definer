class WordDefiner
  @@list = []
  attr_accessor :define_word, :word_meaning
  attr_reader :id

  def initialize(attributes)
    @define_word = attributes.fetch('define_word')
    @word_meaning = attributes.fetch('word_meaning')
    @id = @@list.length + 1
  end

  def self.find(id)
    define_id = id.to_i()
    @@list.each do |define|
      if define.id == define_id
        return define
      end
    end
  end

  def self.remove_word(id)
    @@list.map do |definer|
      if definer.id == id
        definer.define_word = ""
        definer.word_meaning = ""
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



  def update(attributes)
  end

end
