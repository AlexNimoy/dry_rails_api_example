# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HealthCheckController, type: :controller do
  let(:setup_stubs) {}

  before do
    setup_stubs
    @controller = described_class.new
  end

  subject do
    response
  end

  describe 'GET #index' do
    before { get :show }

    context 'when an error occurs fetching students' do
      let(:result_message) { { result: :result } }

      let(:setup_stubs) do
        AppContainer.stub('health_check', -> { result_message })
      end

      it { expect(response.body).to eq(result_message.to_json) }
      it { expect(response).to have_http_status(:ok) }
    end
  end
end
