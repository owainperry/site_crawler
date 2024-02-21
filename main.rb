#!/usr/bin/env ruby
require "logger"
require "fileutils"
require "meshx-plugin-sdk"

class Plugin
  def initialize(api, log, config)
    @api = api
    @log = log
    @config = config
    @plugin_id = Helper.get_env_or_fail("X_PLUGIN_ID")
  end

  def on_file_event(event)
    @log.info("file event #{event.path} #{event.filename}")
  end

  def on_complete_event(event)
    @log.info("complete event")
  end

  def on_folder_event(event)
    @log.info("folder event")
  end
end

plugin = Plugin.new(FoundationApi.new(), Logger.new(STDOUT), Config.new())
controller = Controller.new(plugin)
controller.run()
