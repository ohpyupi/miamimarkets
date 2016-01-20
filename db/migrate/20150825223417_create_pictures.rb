class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
			t.string	:post_id
			t.attachment	:photo

      t.timestamps
    end
  end
end
