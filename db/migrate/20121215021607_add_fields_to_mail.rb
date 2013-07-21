class AddFieldsToMail < ActiveRecord::Migration
  def change
    add_column :mails, :page_count, :integer
    add_column :mails, :file_url, :string
  end
end
