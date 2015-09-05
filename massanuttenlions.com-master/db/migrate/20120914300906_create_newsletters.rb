class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.text "header"
      t.text "footer"
      t.text "content", :null => false, :default => ""
      t.boolean "visible", :default => false
      t.date "period"
      t.timestamps
    end
  end
end
