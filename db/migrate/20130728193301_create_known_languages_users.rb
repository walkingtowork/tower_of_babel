class CreateKnownLanguagesUsers < ActiveRecord::Migration
  def change
    create_table :known_languages_users do |t|
      t.integer :known_language_id
      t.integer :user_id

    end
  end
end