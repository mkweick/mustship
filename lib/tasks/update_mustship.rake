require 'odbc'

namespace :mustship do
  desc "Rake task to update mustship data from AS400"
  task update: :environment do
    def set_order_totals(total)
      { "not_dispatched" => total[0], "not_picked" => total[1],
        "not_verified" => total[2], "verified" => total[3] }
    end

    def set_order_details(order)
      { "order_num" => order[0], "order_gen" => order[1],
        "carrier" => order[2], "dispatch_date" => order[3],
        "dispatch_time" => order[4], "buf_picker" => order[5],
        "buf_unit" => order[6], "ont_picker" => order[7],
        "ont_unit" => order[8], "account_name" => order[9] }
    end

    def find_existing_order(order_num)
      Mustship.find_by(order_num: order_num)
    end

    as400 = ODBC.connect('mustship')

    sql_ms_order_totals = "SELECT mtdispat, mtpicked, mtverify,
                         mtverftd FROM mustshiptl"
    sql_ms_orders = "SELECT msorno, msorgn, mscacd, msddate, msdtime, mspicker1,
                   msunit1, mspicker2, msunit2, mscsnm FROM mustshiplx"

    stmt_totals = as400.run(sql_ms_order_totals)
    ms_totals = stmt_totals.fetch_all
    unless ms_totals.nil?
      ms_totals.each do |total|
        live_totals = set_order_totals(total)
        totals = MustshipTotal.first
        totals ? (totals.update(live_totals)) : (MustshipTotal.create(live_totals))
      end
    end

    updated_order_nums = []
    stmt_orders = as400.run(sql_ms_orders)
    ms_orders = stmt_orders.fetch_all
    unless ms_orders.nil?
      ms_orders.each do |order|
        updated_order_nums << order[0]
        existing_order = find_existing_order(order[0])
        order_details = set_order_details(order)

        if existing_order
          unless order_details == existing_order.attributes.except('id')
            existing_order.update(order_details)
          end
        else
          Mustship.create(order_details)
        end
      end
    end

    as400.commit
    as400.disconnect

    @ms_order_numbers = Mustship.pluck(:order_num)
    @ms_order_numbers.each do |order_num|
      unless updated_order_nums.include? order_num
        Mustship.find_by(order_num: order_num).destroy
      end
    end
  end
end
