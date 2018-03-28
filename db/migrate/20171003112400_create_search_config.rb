# frozen_string_literal: true

class CreateSearchConfig < ActiveRecord::Migration[5.1]
  def up
    enable_extension :unaccent
    enable_extension :pg_trgm

    language = 'english'
    execute <<-SQL
      CREATE TEXT SEARCH DICTIONARY #{language}_stem ( TEMPLATE = snowball, Language = #{language}, StopWords = #{language} );
      CREATE TEXT SEARCH CONFIGURATION fundaction (COPY = '#{language}');
      ALTER TEXT SEARCH CONFIGURATION fundaction ALTER MAPPING FOR hword, hword_part, word with unaccent, #{language}_stem;
    SQL
  end

  def down
    execute "drop text search configuation fundaction"
  end
end
