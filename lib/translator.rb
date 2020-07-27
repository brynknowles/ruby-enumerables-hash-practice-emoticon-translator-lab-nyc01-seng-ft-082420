# require modules here
require 'pry'
require 'yaml'

def load_library(file)
  # code goes here
  data = YAML.load_file(file)
  result = data.each_with_object({}) do |(emo_meaning, emoti_values), final_hash|
  # binding.pry
    if !final_hash[emo_meaning]
      final_hash[emo_meaning]= {
        :english => emoti_values[0], 
        :japanese => emoti_values[1]
      }
      # binding.pry
    end
  result
  end
end

def get_english_meaning(file, emoticon)
  # binding.pry
  english_meaning = ""
  apology = "Sorry, that emoticon was not found"
  library = load_library(file)
  #binding pry
  library.each do |emo_meaning, lang_hash|
    # binding.pry
    lang_hash.each do |lang_key, lang_emoti|
      #binding.pry
      if emoticon == lang_emoti
        english_meaning = emo_meaning
      end  
      if english_meaning == ""
        english_meaning = apology
      end
    end
  end
  english_meaning
  # binding.pry
end

def get_japanese_emoticon(file, emoticon)
  japanese_emoticon = ""
  apology = "Sorry, that emoticon was not found"
  library = load_library(file)
  # binding.pry
  library.each do |key, value|
    # binding.pry
    if emoticon == value[:english]
      japanese_emoticon = value[:japanese]
    end
    if japanese_emoticon == ""
      japanese_emoticon = apology
    end
    # binding.pry
  end
  japanese_emoticon
  # binding.pry
end
