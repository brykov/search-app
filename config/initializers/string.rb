class String

  # converts snake case strings to readable captions
  # example:
  #   "user_id" becomes "User Id"
  #   "created_at" becomes "Created At"
  def captionify
    self.split('_').map(&:capitalize).join(' ')
  end
end