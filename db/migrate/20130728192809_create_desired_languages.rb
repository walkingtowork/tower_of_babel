class CreateDesiredLanguages < ActiveRecord::Migration
  def change
    create_table :desired_languages do |t|

      t.timestamps
    end
  end
end
