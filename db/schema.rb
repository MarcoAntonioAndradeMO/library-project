# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_03_135529) do
  create_table "add_author_to_books", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_add_author_to_books_on_author_id"
    t.index ["book_id"], name: "index_add_author_to_books_on_book_id"
  end

  create_table "add_book_to_loans", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "loan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_add_book_to_loans_on_book_id"
    t.index ["loan_id"], name: "index_add_book_to_loans_on_loan_id"
  end

  create_table "add_theme_to_books", force: :cascade do |t|
    t.integer "theme_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_add_theme_to_books_on_book_id"
    t.index ["theme_id"], name: "index_add_theme_to_books_on_theme_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "proper_name"
    t.string "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "book_name"
    t.date "year"
    t.string "isbn"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string "proper_name"
    t.string "function"
    t.date "effectuation_date"
    t.date "resignation_date"
    t.string "loans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer "employer_id", null: false
    t.integer "student_id", null: false
    t.date "loan_date"
    t.date "return"
    t.date "forecasted_return"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_loans_on_employer_id"
    t.index ["student_id"], name: "index_loans_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "proper_name"
    t.string "registration"
    t.string "course"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "add_author_to_books", "authors"
  add_foreign_key "add_author_to_books", "books"
  add_foreign_key "add_book_to_loans", "books"
  add_foreign_key "add_book_to_loans", "loans"
  add_foreign_key "add_theme_to_books", "books"
  add_foreign_key "add_theme_to_books", "themes"
  add_foreign_key "loans", "employers"
  add_foreign_key "loans", "students"
end
