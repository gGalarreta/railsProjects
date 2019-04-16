unless @data.nil?
  json.data(@data)
end

unless @msgs.nil?
  json.messages(@msgs)
end

unless @error.nil?
  json.error(@error)
end

unless @token.nil?
  json.token(@token)
end