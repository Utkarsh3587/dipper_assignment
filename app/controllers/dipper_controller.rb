class DipperController < ApplicationController

  @@connection = {}
  @@kill_connection = {}
  before_action :set_params, only: [:do_request]

  def do_request
    incoming_req_time = @@connection[@conn_id][:incoming_time]
    delay = incoming_req_time + @@connection[@conn_id][:kill_time]
    while ( incoming_req_time <= delay)
      if @@kill_connection[@conn_id] == true
        @@connection[@conn_id] = nil
        kill_status=1
        break
      end
      incoming_req_time += 1
    end

    if kill_status==1
      @@kill_connection[@conn_id]=false
      render json: {status: 'killed'}
    else
      render json: {status: 'ok'}
    end
  end

  def server_status
    status={}
    @@connection.each do |key, _value|
      current_time = Time.now.to_i
      if current_time >= @@connection[key][:incoming_time] + @@connection[key][:kill_time]
        @@connection[key] = nil
      else
        status[key] = (@@connection[key][:incoming_time] + @@connection[key][:kill_time] - current_time).to_s
        end
    end
    render json: status.to_json
  end

  def kill
    @@connection.each do |key, _value|
      current_time = Time.now.to_i
      if current_time >= @@connection[key][:incoming_time] + @@connection[key][:kill_time]
        @@connection[key] = nil
      end
    end
    conn_id=params[:connId]
    @@kill_connection[conn_id] = true
    if @@connection[conn_id]
      render json: {status: "ok"}
    else
      render json: {status: "Not Found connId #{conn_id}"}
    end
  end

  private

  def set_params
    @conn_id = params[:connId]
    @timeout = params[:timeout].to_i * 1000
    @@connection[@conn_id] = {incoming_time: Time.now.to_i, kill_time: @timeout}
    @@kill_connection[@conn_id] = false
  end
end
