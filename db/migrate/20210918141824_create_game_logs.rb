class CreateGameLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :game_logs do |t|
      t.integer :user_id_1, null: false
      t.integer :user_id_2, null: false
      t.timestamps
    end
  end
end
