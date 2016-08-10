class Course < ApplicationRecord
	has_many :chapters, :dependent => :destroy
		mount_uploader :thumbnail, ImageUploader
end
