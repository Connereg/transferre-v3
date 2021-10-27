class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.float :balance
      t.float :remainder
<<<<<<< HEAD:db/migrate/20211026143534_create_users.rb

=======
>>>>>>> @{u}:db/migrate/20211026212721_create_users.rb

      t.timestamps
    end
  end
end
