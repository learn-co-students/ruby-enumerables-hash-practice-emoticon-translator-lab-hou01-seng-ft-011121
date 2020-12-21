# require modules here
require 'yaml'
require 'pry'


def load_library(file_path)
  # code goes here
  inside_yaml_file = YAML.load_file(file_path)

  final_hash = inside_yaml_file.each_with_object({}) do |(key, values), hash|
  
    hash[key] = {}
  
    hash[key][:english] = values.shift
    hash[key][:japanese] = values.shift
  end
  final_hash
end



def get_japanese_emoticon(yaml_dir, eng_symbol)
  # code goes here
  hash_final = load_library(yaml_dir)
  
  english_loop = hash_final.each do |sym_name, languages|
    languages.each do |language, symbol|
      if symbol == eng_symbol
        return hash_final[sym_name][:japanese]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end



def get_english_meaning(yaml_dir, jap_symbol)
  # code goes here
  final_hash = load_library(yaml_dir)
  
  japanese_loop = final_hash.each do |sym_name, languages|
    languages.each do |language, symbol|
      #binding.pry
      if symbol == jap_symbol
        return sym_name
      end
    end
  end
  return "Sorry, that emoticon was not found"
end