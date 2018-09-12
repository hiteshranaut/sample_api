class CreateCompromisedServices < ActiveRecord::Migration[5.1]
  def change
    create_table :compromised_services, id: :uuid do |t|
      t.string :services
      t.integer :confidence_lvl
      t.integer :compromise_count
      t.string :leak_source

      t.timestamps
    end
  end
end
