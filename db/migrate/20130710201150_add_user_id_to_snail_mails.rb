class AddUserIdToSnailMails < ActiveRecord::Migration
  def change
    add_column :snail_mails, :user_id, :string
  end
end
