class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string "name"
      t.string "meeting_address"
      t.string "mailing_address"
      t.string "city"
      t.string "postal_code"
      t.string "state", :default => "Virginia"
      t.string "email"
      t.string "president_email"
      t.string "webmaster_email"
      t.string "newsletter_editor_email"
      t.string "secretary_email"
      t.string "photographer_email"
      t.string "phone"
      t.string "current_year"
      t.has_attached_file :avatar
      t.timestamps
    end
  end
end
