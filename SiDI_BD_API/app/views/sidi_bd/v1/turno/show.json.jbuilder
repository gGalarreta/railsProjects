unless @student.nil?
  json.data(@student)
end

unless @token.nil?
  json.token(@token)
end