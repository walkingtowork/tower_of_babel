class CreateDesiredLanguagesUsers < ActiveRecord::Migration
  def change
    create_table :desired_languages_users do |t|
      t.integer :desired_language_id
      t.integer :user_id

    end
  end
end