class AddHeaderToProfile < ActiveRecord::Migration
  def change
    add_attachment :profiles, :page_header
    add_column :profiles, :page_color, :string
  end
end
