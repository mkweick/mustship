require 'odbc'
CONNECTION = ODBC.connect("mustship", '', '')

task update_mustship: :environment do
  def set_order_details(order)
    { "order_num" => order[0], "order_gen" => order[1],
      "carrier" => order[2], "dispatch_date" => order[3],
      "dispatch_time" => order[4], "buf_picker" => order[5],
      "buf_unit" => order[6], "ont_picker" => order[7],
      "ont_unit" => order[8], "account_name" => order[9] }
  end

  sql = "SELECT MSORNO, MSORGN, MSCACD, MSDDATE, MSDTIME, MSPICKER1,
         MSUNIT1, MSPICKER2, MSUNIT2, MSCSNM FROM MUSTSHIPLX"
  stmnt = CONNECTION.prepare(sql)
  ms_orders = stmnt.execute

  current_ms_orders = []
  ms_orders.each do |order|
    current_ms_orders << order[0]
    existing_order = Mustship.find_by(order_num: order[0])
    current_order_details = set_order_details(order)
    if existing_order
      unless current_order_details == existing_order.attributes.except('id')
        existing_order.update(current_order_details)
      end
    else
      Mustship.create(current_order_details)
    end
  end

  stmnt.drop

  @mustships = Mustship.all
  @mustships.each do |ms|
    unless current_ms_orders.include? ms.order_num
      ms.destroy
    end
  end
end
