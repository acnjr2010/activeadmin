module ActiveAdmin
  class Engine < ::Rails::Engine
    initializer "active_admin.load_app_path" do |app|
      ActiveAdmin::Application.setting :load_paths, [File.expand_path('app/admin', app.root)]
    end

    initializer "active_admin.precompile", group: :all do |app|
      ActiveAdmin.application.stylesheets.each do |path, _|
        app.config.assets.precompile << path
      end
      ActiveAdmin.application.javascripts.each do |path|
        app.config.assets.precompile << path
      end
    end

    initializer 'active_admin.routes' do
      require 'active_admin/helpers/routes/url_helpers'
    end
  end
end
