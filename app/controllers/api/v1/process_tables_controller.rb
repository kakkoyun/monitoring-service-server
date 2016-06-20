class Api::V1::ProcessTablesController < Api::V1::BaseController

  api :POST, '/process_tables', 'Create Process Table Snapshot'
  param :process_table_items_attributes, Array, desc: "process table items, with name and cpu usage amount", required: true
  description "Creates Process Table with given items, determines server from authentication token."
  formats ['json']
  error code: 400, desc: 'Bad Request', meta: { possible_cause: "Ensure mandatory params" }
  error code: 401, desc: 'Unauthorized'
  error code: 422, desc: 'Unprocessable Entity', meta: { possible_cause: "Ensure mandatory params" }
  error code: 500, desc: 'Internal Server Error'

  def create
    @process_table = ProcessTable.new(process_table_params)
    @process_table.server = server
    @process_table.save
    respond_with @process_table, location: api_v1_process_tables_path(@process_table)
  end

  private

  def process_table_params
    params.require(:process_table).permit(process_table_items_attributes: [:cpu_usage_amount, :name])
  end
end
