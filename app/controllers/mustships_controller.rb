class MustshipsController < ApplicationController
  before_action :retrieve_data

  def index; end
  def index_desktop; end
  def update_data; end
  def update_data_desktop; end

  private

  def retrieve_data 
    @totals = MustshipTotal.first
    @mustships = Mustship.all.order(dispatch_date: :asc, dispatch_time: :asc)
  end
end
