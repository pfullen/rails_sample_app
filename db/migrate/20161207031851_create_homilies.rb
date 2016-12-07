class CreateHomilies < ActiveRecord::Migration[5.0]
  def change
    create_table :homilies do |t|
      t.date :date
      t.string :subject
      t.string :week
      t.string :time
      t.string :cycle
      t.string :first_reading_book
      t.string :first_reading_chapter
      t.string :first_reading_verse
      t.string :second_reading_book
      t.string :second_reading_chapter
      t.string :second_reading_verse
      t.string :gospel_book
      t.string :gospel_chapter
      t.string :gospel_verse
      t.text :homily_text
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
