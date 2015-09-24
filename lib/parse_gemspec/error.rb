module ParseGemspec
  class ParseGemspecError < StandardError; end
  class GemspecFileNotFoundError < ParseGemspecError; end
end
