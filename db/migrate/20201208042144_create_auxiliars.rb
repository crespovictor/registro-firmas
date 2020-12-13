class CreateAuxiliars < ActiveRecord::Migration[6.0]
  def change
    create_table :auxiliars do |t|
      t.text :nombre

      t.timestamps
    end
  end
end
