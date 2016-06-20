class Api::V1::CpuUsagesController < Api::V1::BaseController

  api :POST, '/cpu_usages/:id', 'Create CPU Usage Resource'
  param :amount, BigDecimal, desc: "amount of usage in %", required: true
  description "Creates Cpu usage with given amount, determines server from authentication token."
  formats ['json']
  error code: 400, desc: 'Bad Request', meta: { possible_cause: "Ensure mandatory params" }
  error code: 401, desc: 'Unauthorized'
  error code: 422, desc: 'Unprocessable Entity', meta: { possible_cause: "Ensure mandatory params" }
  error code: 500, desc: 'Internal Server Error'

  def create
    @cpu_usage        = CpuUsage.new(cpu_usage_params)
    @cpu_usage.server = server
    @cpu_usage.save
    respond_with @cpu_usage, location: api_v1_cpu_usages_path(@cpu_usage)
  end

  private

  def cpu_usage_params
    params.require(:cpu_usage).permit(:amount)
  end
end
