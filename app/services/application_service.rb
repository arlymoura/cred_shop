class ApplicationService
  def self.call(*args)
    new(*args).call
  end

  def call
    raise NotImplementedError, "Subclasse deve implementar o método 'call'"
  end
end
