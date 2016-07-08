class String
  def sanitize
    ActionView::Base.full_sanitizer.sanitize(self)
  end
end
