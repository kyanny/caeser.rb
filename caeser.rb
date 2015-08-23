class Caeser
  def self.decode(offset, str)
    new(offset, str).decode
  end

  def self.encode(offset, str)
    new(offset, str).encode
  end

  def initialize(offset, str)
    @offset = offset
    @str = str
  end

  attr_reader :offset, :str

  def decode
    chars.map { |c|
      c.match(/\s/) ? c : Char.new(c).prev(offset)
    }.join
  end

  def encode
    chars.map { |c|
      c.match(/\s/) ? c : Char.new(c).next(offset)
    }.join
  end

  def chars
    str.split(//)
  end

  class Char
    def initialize(char)
      @char = char
    end

    attr_reader :char

    ALPHABET = ('a'..'z').to_a.freeze

    def next(n)
      ALPHABET[(ALPHABET.index(char) + n) % ALPHABET.length]
    end

    def prev(n)
      ALPHABET[(ALPHABET.index(char) - n) % ALPHABET.length]
    end
  end
end
