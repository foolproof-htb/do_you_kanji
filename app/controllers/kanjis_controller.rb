class KanjisController < ApplicationController
  def index; end

  def search
    return unless params[:character].present?

    @kanjis = search_by_character_type(params[:character])
    flash.now[:notice] = '検索ワードは訓読み（ひらがな）、音読み（カタカナ）、漢字１文字のいずれかで入力してください。' unless @kanjis
    render :index
  end

  private

  def search_by_character_type(str)
    case str
    when /\A(?:\p{Hiragana}+\z|\p{Katakana}+\z)\z/ # 全文字が平仮名か片仮名のみの場合
      kanjis = KanjiApiClient.fetch_kanjis_by_reading(str)
      kanjis['main_kanji'].concat(kanjis['name_kanji'])
    when /\A\p{Han}\z/ # 漢字１文字の場合
      kanji = KanjiApiClient.fetch_kanji_by_kanji_character(str)
      [kanji['kanji']]
    end
  end
end
