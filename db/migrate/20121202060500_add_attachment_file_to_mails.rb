class AddAttachmentFileToMails < ActiveRecord::Migration
  def self.up
    change_table :mails do |t|
      t.has_attached_file :file
    end
  end

  def self.down
    drop_attached_file :mails, :file
  end
end
