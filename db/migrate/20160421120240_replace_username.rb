class ReplaceUsername < ActiveRecord::Migration
  def change 
      change_table :users do |u|
        u.rename :username, :name
      end
  end
end
