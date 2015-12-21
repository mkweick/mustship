class MustshipsController < ApplicationController

  def index
    @totals = MustshipTotal.first
    @mustships = Mustship.all.order(dispatch_date: :asc, dispatch_time: :asc)
    @total_mustships = Mustship.count.to_s
  end

  def index_desktop
    @totals = MustshipTotal.first
    @mustships = Mustship.all.order(dispatch_date: :asc, dispatch_time: :asc)
    @total_mustships = Mustship.count.to_s
  end
end
