class CreateCompromisedAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :compromised_accounts, id: :uuid do |t|
      t.string :username
      t.string :email
      t.string :suspected_compromised_service
      t.string :leak_source

      t.timestamps
    end
  end
end
