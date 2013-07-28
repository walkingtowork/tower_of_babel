class CreateKnownLanguages < ActiveRecord::Migration
  def change
    create_table :known_languages do |t|

      t.timestamps
    end
  end
end
