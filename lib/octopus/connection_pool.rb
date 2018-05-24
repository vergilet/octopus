class ActiveRecord::ConnectionAdapters::ConnectionPool
  def discard! # :nodoc:
    synchronize do
      return if @connections.nil? # already discarded
      @connections.each do |conn|
        conn.discard!
      end

      @connections = []
      @available.clear
    end
  end
end
