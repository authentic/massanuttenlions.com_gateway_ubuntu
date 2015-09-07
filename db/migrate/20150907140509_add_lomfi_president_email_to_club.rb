class AddLomfiPresidentEmailToClub < ActiveRecord::Migration

    def up
      add_column :clubs, :lomfi_president_email, :string
    end

    def down
      remove_column :clubs, :lomfi_president_email
    end

  end
