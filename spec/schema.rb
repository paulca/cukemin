ActiveRecord::Schema.define(:version => 0) do
  create_table "test_models", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end