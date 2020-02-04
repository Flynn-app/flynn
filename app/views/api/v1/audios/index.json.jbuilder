json.array! @audios do |audio|
  json.extract! audio, :id, :title, :text_url, :language, :text_to_transcript,
                       :iso
end
