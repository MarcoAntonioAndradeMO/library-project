json.extract! loan, :id, :book_id, :employer_id, :student_id, :loan_date, :return, :forecasted_return, :created_at, :updated_at
json.url loan_url(loan, format: :json)
