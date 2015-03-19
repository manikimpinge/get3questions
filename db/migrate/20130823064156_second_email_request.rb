class SecondEmailRequest < ActiveRecord::Migration
  def change
    add_column :users, :second_email_request, :boolean
  end
end
