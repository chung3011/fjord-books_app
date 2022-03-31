class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :commentable, polymorphic: true, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
