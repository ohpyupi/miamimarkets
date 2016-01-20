class Picture < ActiveRecord::Base
	
	belongs_to	:post

	has_attached_file	:photo,
		:styles => {:large => "400x400#", :medium => "130x130#"},
#		:path => ":rails_root/public/uploads/picture/photo/:id/:filename",
#		:url => "/uploads/picture/photo/:id/:filename"
		:default_url => "/images/default_:style.png"

	do_not_validate_attachment_file_type	:photo

end
