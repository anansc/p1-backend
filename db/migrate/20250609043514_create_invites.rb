class CreateInvites < ActiveRecord::Migration[8.0]
  def change
    create_table :invites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :house, null: false, foreign_key: true
      t.string :email, null: false
      t.string :token, null: false, unique: true
      t.datetime :expires_at, null: false
      t.boolean :accepted, default: false, null: false
      t.datetime :accepted_at
      t.datetime :revoked_at
      t.string :status, null: false, default: "pending"
      t.timestamps
    end
  end
end
