class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :follower, null: false
      t.references :followed, null: false

      t.timestamps
    end
  end
end
