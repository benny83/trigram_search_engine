class AddTrgmIndexToDt < ActiveRecord::Migration[5.0]
  def up
    # execute 'CREATE INDEX trgm_idx ON countries USING gin (name gin_trgm_ops)'
    add_index 'countries', 'name', name: 'trgm_idx', using: :gin, order: { name: :gin_trgm_ops }
  end

  def down
    remove_index :countries, name: 'trgm_idx'
  end
end
