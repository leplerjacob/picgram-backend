class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :follower, null: false, references: :users 

      t.timestamps
    end
  end
end
