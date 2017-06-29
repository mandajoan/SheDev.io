class AddAttachmentPictureUploadToPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :posts do |t|
      t.attachment :picture_upload
    end
  end

  def self.down
    remove_attachment :posts, :picture_upload
  end
end
