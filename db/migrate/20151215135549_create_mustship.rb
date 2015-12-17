class CreateMustship < ActiveRecord::Migration
  def change
    create_table :mustships do |t|
      t.string :order_num
      t.string :order_gen
      t.string :carrier
      t.string :dispatch_date
      t.string :dispatch_time
      t.string :buf_picker
      t.string :buf_unit
      t.string :ont_picker
      t.string :ont_unit
      t.string :account_name
    end
  end
end
