class Api::V1::DiskUsagesController < Api::V1::BaseController

  api :POST, '/disk_usages', 'Create Disk Usage Resource'
  param :amount, Integer, desc: "amount of usage.", required: true
  param :ration, BigDecimal, desc: "ratio of usage in %", required: true
  description "Creates Disk usage with given amount and ratio, determines server from authentication token."
  formats ['json']
  error code: 400, desc: 'Bad Request', meta: { possible_cause: "Ensure mandatory params" }
  error code: 401, desc: 'Unauthorized'
  error code: 422, desc: 'Unprocessable Entity', meta: { possible_cause: "Ensure mandatory params" }
  error code: 500, desc: 'Internal Server Error'

  def create
    @disk_usage        = DiskUsage.new(disk_usage_params)
    @disk_usage.server = server
    @disk_usage.save
    respond_with @disk_usage, location: api_v1_disk_usages_path(@disk_usage)
  end

  private

  def disk_usage_params
    params.require(:disk_usage).permit(:amount, :ratio)
  end
end
