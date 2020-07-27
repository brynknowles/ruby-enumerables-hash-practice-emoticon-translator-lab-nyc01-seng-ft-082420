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
  library.each do |emo_meaning, lang_hash |
    # binding.pry
    lang_hash.each do |lang_key, lang_emoti|
      # binding.pry
      if emoticon == lang_emoti
        japanese_emoticon = lang_hash[:japanese][lang_emoti]
        # binding.pry
      end
      if emoticon == ""
        japanese_emoticon = apology
      end
    end
  end
  japanese_emoticon
  # binding.pry
end

# key = hash.keys[0]
# value = hash.values[0]

# def get_japanese_emoticon(yaml_file, eng_emoti)
#   # code goes here
#   translation = ""
#   new_hash = load_library('./lib/emoticons.yml')
#   new_hash.each do |name, languages|
#       eng_emoti == languages[:english]
#       translation = languages[:japanese]
#       return translation
#     end
# end

# english_emote = languages[english]
# japanese_emote = languages[japanese]
# if japanese_emote == passed_in_emote
#     return english_emote
# end

  
