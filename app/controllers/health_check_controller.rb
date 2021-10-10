# frozen_string_literal: true

# HealthCheck
class HealthCheckController < ApplicationController
  include AppImport['health_check']

  def show
    render json: health_check.call
  end
end
