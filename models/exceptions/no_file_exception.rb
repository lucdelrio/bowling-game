class NoFileException < RuntimeError
  def initialize(msg = 'Please specify a file')
    super
  end
end
