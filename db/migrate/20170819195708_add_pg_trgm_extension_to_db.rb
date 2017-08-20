class AddPgTrgmExtensionToDb < ActiveRecord::Migration[5.0]
  def change
    # execute 'create extension pg_trgm;'
    enable_extension 'pg_trgm'
  end
end
