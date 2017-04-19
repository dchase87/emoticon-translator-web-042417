require "yaml"

def load_library(file_path)
  new_hash = {}
  emoticons_hash = YAML.load_file("#{file_path}")

  japanese_hash = {}
  english_hash = {}
  new_hash["get_meaning"] = japanese_hash
  new_hash["get_emoticon"] = english_hash

  emoticons_hash.each do|meaning, emoticon_array|
    new_hash["get_meaning"][emoticon_array[1]] = meaning
    new_hash["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
  end

  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)

  return_array = []

  hash["get_emoticon"].each do |english_emoticon, japanese_emoticon|
    if english_emoticon == emoticon
      return_array << japanese_emoticon
    end
  end

  if return_array.length > 0
    return_array[0]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)

  return_array = []

  hash["get_meaning"].each do |japanese_emoticon, meaning|
    if emoticon == japanese_emoticon
      return_array << meaning
    end
  end

  if return_array.length > 0
    return_array[0]
  else
    "Sorry, that emoticon was not found"
  end
end
