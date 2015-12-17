class MustshipsController < ApplicationController
  require 'odbc'
  CLIENT = ODBC.connect("mustship", "common", "common")

  before_action :set_mustships

  def index
    ms_totals = "SELECT MTDISPAT, MTPICKED, MTVERIFY, MTVERFTD from MUSTSHIPTL"
    totals_script = CLIENT.prepare(ms_totals)
    totals = totals_script.execute

    totals.each do |total|
      @to_be_dispatched = total[0]
      @to_be_picked = total[1]
      @to_be_verified = total[2]
      @total_verified = total[3]
    end

    totals_script.drop
  end    

  private

  def set_mustships
    @mustships = Mustship.all.order(dispatch_date: :asc, dispatch_time: :asc)
  end
end