class MustshipsController < ApplicationController
  require 'odbc'
  CONNECTION = ODBC.connect("mustship", '', '')

  before_action :set_mustships

def index
    sql = "SELECT MTDISPAT, MTPICKED, MTVERIFY, MTVERFTD from MUSTSHIPTL"
    stmnt = CONNECTION.prepare(sql)
    ms_totals = stmnt.execute

    ms_totals.each do |total|
      @to_be_dispatched = total[0]
      @to_be_picked = total[1]
      @to_be_verified = total[2]
      @total_verified = total[3]
    end

    stmnt.drop
  end

  private

  def set_mustships
    @mustships = Mustship.all.order(dispatch_date: :asc, dispatch_time: :asc)
  end
end
