# frozen_string_literal: true

require 'dry/system/container'

# IoC container
#
class AppContainer < Dry::System::Container
  configure do |config|
    config.name = :dry_rails_example
    config.root = Pathname('app')
    config.component_dirs.add 'services'
  end
end

AppImport = AppContainer.injector

AppContainer.finalize! if Rails.env.production?
