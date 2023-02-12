class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, after: :introduction
  end
end
