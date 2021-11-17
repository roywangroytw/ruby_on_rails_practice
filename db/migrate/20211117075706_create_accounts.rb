class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :surname
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
