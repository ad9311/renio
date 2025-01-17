module Callable
  extend ActiveSupport::Concern

  class_methods do
    def call(**args)
      new(**args).call
    end
  end

  included do
    def call
      raise NotImplementedError, "Subclass #{self.class.name} must implement #call"
    end
  end
end
