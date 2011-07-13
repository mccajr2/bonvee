class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :source
      t.string :item_type
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
