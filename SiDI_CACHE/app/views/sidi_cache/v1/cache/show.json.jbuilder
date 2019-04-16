unless @alumno.nil?
  json.data(@alumno)
end

unless @rec.nil?
  json.extra(@rec)
end