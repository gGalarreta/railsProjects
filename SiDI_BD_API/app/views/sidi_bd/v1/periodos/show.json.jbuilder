unless @periodos.nil?
  json.data(@periodos)
end

unless @token.nil?
  json.token(@token)
end