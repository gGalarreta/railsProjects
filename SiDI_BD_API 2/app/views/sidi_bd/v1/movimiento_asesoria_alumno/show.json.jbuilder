unless @student.nil?
  json.data(@student)
else
  json.error("No se encontraron registros")
end
