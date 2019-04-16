unless @student.nil?
  json.data(@student)
end

unless @msgs.nil?
  json.messages(@msgs)
end

unless @error.nil?
  json.error(@error)
end

unless @student.nil? || @token_student.nil?
  json.token(@token_student)
end
