# Rails example app with dry-system

[dry container](https://dry-rb.org/gems/dry-system/master/container/)

## IoC container and autolod

File `config/initializers/app_container.rb`

contains the main configuration and injector

```
class AppContainer < Dry::System::Container
  configure do |config|
    config.name = :dry_rails_example
    config.root = Pathname('app')
    config.component_dirs.add 'services'
  end
end

AppImport = AppContainer.injector

AppContainer.finalize! if Rails.env.production?
```

## Tests

Contains stub for IoC containers

`spec/support/dry_system.rb`

In tests container may be stubbed like this

```
  AppContainer.stub('container.name', -> { 'result' })
```
