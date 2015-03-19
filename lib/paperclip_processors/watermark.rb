module Paperclip
  class Watermark < Processor

    def initialize file, options = {}, attachment = nil
      @file       = file
      @options    = options
      @attachment = attachment

      @enabled        = attachment.content_type =~ /^image\/.*/
      @whiny          = options[:whiny].nil? ? true : options[:whiny]
      @format         = options[:format]
      @current_format = File.extname(@file.path)
      @basename       = File.basename(@file.path, @current_format)

      @watermark      = Rails.root.join("app/assets/images/#{options[:watermark_type]}_watermark.png").to_s
    end

    def make
      if @enabled
        watermark
      else
        noop
      end
    end

    def watermark
      src = @file
      format = @format.blank? ? @current_format : @format
      basename = @basename.blank? ? 'file' : @basename

      dst = Tempfile.new([basename, format].compact.join("."))
      dst.binmode

      parameters = "-gravity center :watermark :source :dest"
      begin
        success = Paperclip.run("composite", parameters,
                                :watermark => @watermark,
                                :source => File.expand_path(src.path),
                                :dest => File.expand_path(dst.path))

      rescue Cocaine::CommandLineError
        raise Paperclip::Error, "There was an command line error with imagemagick's composite command for #{@basename}" if @whiny
      rescue Cocaine::ExitStatusError => e
        raise Paperclip::Error, "There was an error processing the watermark for #{@basename}" if @whiny
      rescue Cocaine::CommandNotFoundError => e
        raise Paperclip::Errors::CommandNotFoundError.new("Could not run the `convert` command. Please install imagemagick.")
      end

      dst
    end

    def noop
      src = @file
      format = @format.blank? ? @current_format : @format
      basename = @basename.blank? ? 'file' : @basename

      dst = Tempfile.new([@basename, format].compact.join("."))
      dst.binmode

      src.rewind
      dst.write(src.read)
      dst.flush
      dst.rewind

      dst
    end

  end
end
