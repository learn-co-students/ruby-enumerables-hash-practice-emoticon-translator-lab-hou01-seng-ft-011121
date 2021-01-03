require 'yaml'

def load_library path
  emoticons = YAML.load_file(path)
  ordered_emoticons = {}
   emoticons.each do |meanings, symbols|
     ordered_emoticons[meanings] = {
      :english => symbols[0],
      :japanese => symbols[1]
    }
   end
   ordered_emoticons
end

def get_english_meaning path, emoticon
  emoticon_hash = load_library path

  output = nil
  emoticon_hash.each do |meanings, nested_hash|
    nested_hash.each do |language, symbol|
      if language == :japanese
        if symbol == emoticon
          output = meanings
        end
      end
    end
  end
  if output == nil
    return "Sorry, that emoticon was not found"
  end
  output
end

def get_japanese_emoticon path, emoticon
  emoticon_hash = load_library path

  meaning = nil
  output = nil
  emoticon_hash.each do |meanings, nested_hash|
    nested_hash.each do |language, symbol|
      if language == :english
        if symbol == emoticon
          meaning = meanings
          output = emoticon_hash[meaning][:japanese]
        end
      end
    end
  end
  if output == nil
    return "Sorry, that emoticon was not found"
  end
  output
end
