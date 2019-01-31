class Hash
  # Popular Rails helper to convert hash keys to Symbols
  def symbolize_keys
    transform_keys { |key| key.to_sym rescue key }
  end
end
