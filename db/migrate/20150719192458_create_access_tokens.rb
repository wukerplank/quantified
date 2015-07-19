class CreateAccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.references :user
      t.string :token, limit: 32, unique: true

      t.timestamps null: false
    end
  end
end
