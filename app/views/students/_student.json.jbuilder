json.extract! student, :id, :proper_name, :registration, :course, :cpf, :created_at, :updated_at
json.url student_url(student, format: :json)
