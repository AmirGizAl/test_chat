class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.string :title, null: false, index: true

      t.timestamps
    end
  end
end
