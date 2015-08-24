class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			t.string	:provider
			t.string	:uid
			t.string  :username
			t.string	:token
			t.integer	:usertype, default: 0
			# 0: normal, 1: agents, 2: admin, 9: banned
			t.datetime	:expires_at

      t.timestamps
    end
  end
end
