class Post < ApplicationRecord
  def self.categories
    ['Job', 'Event', 'Question']
  end
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_attached_file :picture_upload,
                    styles: { medium: "300x300#", thumb: "100x100#" },
                    storage: :s3,
                    url: ":s3_domain_url",
                    path: "/:class/:attachment/:id_partition/:style/:filename",
                    s3_region: ENV["S3_REGION"],
                    s3_credentials: Proc.new{ |a| a.instance.s3_credentials }
  def s3_credentials
      {
      bucket: ENV["S3_BUCKET_NAME"],
      access_key_id: ENV["S3_ACCESS_KEY_ID"],
      secret_access_key: ENV["S3_SECRET_ACCESS_KEY"]
      }
  end

validates_attachment_content_type :picture_upload, content_type: /\Aimage\/.*\Z/
end
