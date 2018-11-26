class ExtractionsController < ApplicationController
  def show
    extraction = Extraction.new(params)

    if extraction.valid?
      ExtractFile.call(extraction.url, extraction.filename) { |output_file| send_file(output_file.path) }
    else
      render json: extraction.errors, status: :unprocessable_entity
    end
  rescue ExtractFile::CannotOpenURL
    render json: {url: ['Cannot open URL']}
  rescue ExtractFile::CannotFindFile
    render json: {filename: ['Cannot find requested file in the archive']}
  rescue ExtractFile::ExtractionFailed
    render json: {base: ['Extraction failed (does the server support Content-Range?)']}
  end
end
