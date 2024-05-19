class KanjiApiClient
  include HTTParty

  base_uri 'https://kanjiapi.dev/v1/'

  def self.fetch_kanjis_by_reading(reading)
    get("/reading/#{encoded_character(reading)}")
  end

  def self.fetch_kanji_by_kanji_character(character)
    get("/kanji/#{encoded_character(character)}")
  end

  def self.encoded_character(character)
    URI.encode_www_form([[character]])
  end

  private_class_method :encoded_character
end
