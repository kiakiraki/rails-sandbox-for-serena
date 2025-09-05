# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :comments, :status
    add_index :comments, :created_at
  end
end

