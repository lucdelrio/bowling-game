class NoFileException < Exception

  def initialize(msg='Please specify a file')
    super
  end
end