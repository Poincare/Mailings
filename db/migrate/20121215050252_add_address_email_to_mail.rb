class AddAddressEmailToMail < ActiveRecord::Migration
  def change
    add_column :mails, :sender_address, :string
    add_column :mails, :recipient_address, :string
    add_column :mails, :email, :string
  end
end
