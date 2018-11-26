class ExtractFile < ApplicationService
  CannotOpenURL = Class.new(StandardError)
  CannotFindFile = Class.new(StandardError)
  ExtractionFailed = Class.new(StandardError)

  attr_reader :archive_url, :filename

  def initialize(archive_url, filename)
    @archive_url = archive_url
    @filename = filename
  end

  def call
    Tempfile.open do |tempfile|
      tempfile.close

      output, status = Open3.capture2e('partialzip', archive_url, filename, tempfile.path)

      raise CannotOpenURL if output.scrub =~ /^Cannot open/
      raise CannotFindFile if output.scrub =~ /^Cannot find/
      raise ExtractionFailed unless status.success?

      yield tempfile
    end
  end
end
