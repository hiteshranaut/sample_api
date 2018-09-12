class CreateApiTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :api_tokens, id: :uuid , default: 'gen_random_uuid()' do |t|
      t.string :name
      t.string :token_type
      t.string :token_key
      t.string :token_secret
      t.string :description
      t.boolean :is_live
      #t.references :user, foreign_key: true
      t.belongs_to :user, type: :uuid , foreign_key: true
      t.timestamps
    end
    add_index :api_tokens, :token_key, unique: true
    add_index :api_tokens, :token_secret, unique: true
  end
end
