class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy]
  before_action :set_applications, only: [:new, :edit]

  set_tab :servers

  def index
    @servers                     = Server.all
    # NOTICE: These kind of the reason why I like relational databases much much more.
    @servers_with_most_cpu_usage = CpuUsage.order_by(amount: :desc, created_at: :desc).to_a.map(&:server).uniq.compact
    @servers_with_low_disk_space = DiskUsage.order_by(ratio: :desc, created_at: :desc).to_a.map(&:server).uniq.compact
    respond_with(@servers)
  end

  def show
    @last_cpu_usage      = @server.cpu_usages.order_by(created_at: :desc).first
    @last_disk_usage     = @server.disk_usages.order_by(created_at: :desc).first
    @process_table       = @server.process_tables.order_by(created_at: :desc).first
    @process_table_items = @process_table.process_table_items.order_by(cpu_usage_amount: :desc) if @process_table
    respond_with(@server)
  end

  def new
    @server = Server.new
    respond_with(@server)
  end

  def edit
  end

  def create
    @server = Server.new(server_params)
    @server.save
    respond_with(@server)
  end

  def update
    @server.update(server_params)
    respond_with(@server)
  end

  def destroy
    @server.destroy
    respond_with(@server)
  end

  private

  def set_applications
    @applications = Doorkeeper::Application.all
  end

  def set_server
    @server = Server.find(params[:id])
  end

  def server_params
    params.require(:server).permit(:name, :application_id, :public_ip)
  end

end
