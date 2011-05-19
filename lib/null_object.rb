class NullObject < NilClass
  def self.method_missing(method)
    self
  end
  
  def self.nil?
    true
  end
end