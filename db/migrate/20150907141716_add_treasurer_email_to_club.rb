class AddTreasurerEmailToClub < ActiveRecord::Migration

  def up
    add_column :clubs, :treasurer_email, :string
  end

  def down
    remove_column :clubs, :treasurer_email
  end
end
