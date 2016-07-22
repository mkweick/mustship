class CreateMustshipTotal < ActiveRecord::Migration
  def change
    create_table :mustship_totals do |t|
      t.string :not_dispatched, default: "0", null: false
      t.string :not_picked,     default: "0", null: false
      t.string :not_verified,   default: "0", null: false
      t.string :verified,       default: "0", null: false
    end

    MustshipTotal.create
  end
end