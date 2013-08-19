def self.stale?
  puts Time.now - self.created_at < (15 * 60)
end
