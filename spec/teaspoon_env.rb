Teaspoon.configure do |config|
  config.mount_at = '/teaspoon'
  config.root = nil
  config.asset_paths = ['spec/javascripts', 'spec/javascripts/stylesheets']
  config.fixture_paths = ['spec/javascripts/fixtures']
  config.formatters = [:documentation]
  config.suite do |suite|
    suite.use_framework :jasmine, '2.3.4'
    suite.matcher = "{spec/javascripts,app/assets}/**/*_spec.{js,js.coffee,coffee}"
    suite.helper = 'spec_helper'
    suite.boot_partial = 'boot'
    suite.body_partial = 'body'
  end

  config.coverage do |coverage|
    # Which coverage reports Istanbul should generate. Correlates directly to what Istanbul supports.
    #
    # Available: text-summary, text, html, lcov, lcovonly, cobertura, teamcity
    #coverage.reports = ["text-summary", "html"]

    # The path that the coverage should be written to - when there's an artifact to write to disk.
    # Note: Relative to `config.root`.
    #coverage.output_path = "coverage"

    # Assets to be ignored when generating coverage reports. Accepts an array of filenames or regular expressions. The
    # default excludes assets from vendor, gems and support libraries.
    #coverage.ignore = [%r{/lib/ruby/gems/}, %r{/vendor/assets/}, %r{/support/}, %r{/(.+)_helper.}]

    # Various thresholds requirements can be defined, and those thresholds will be checked at the end of a run. If any
    # aren't met the run will fail with a message. Thresholds can be defined as a percentage (0-100), or nil.
    #coverage.statements = nil
    #coverage.functions = nil
    #coverage.branches = nil
    #coverage.lines = nil
  end
end
