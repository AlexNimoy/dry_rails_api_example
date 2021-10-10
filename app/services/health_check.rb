# frozen_string_literal: true

# HealthCheck
class HealthCheck
  def call
    { status: :ok }
  end
end
