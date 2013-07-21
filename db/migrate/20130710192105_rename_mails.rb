class RenameMails < ActiveRecord::Migration
  def up
    rename_table :mails, :snail_mails
  end

  def down
    rename_table :snail_mails, :mails
  end
end
