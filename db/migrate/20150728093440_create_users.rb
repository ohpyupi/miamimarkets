class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			t.string	:provider
			t.string	:uid
			t.string  :username
			t.string	:token
			t.datetime	:expires_at

      t.timestamps
    end
  end
end
