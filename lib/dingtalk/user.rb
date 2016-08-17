module DingTalk
  class User
    def self.get(id)
      new(Service.user_get(userid: id))
    end
    attr_reader :id, :name
    def initialize(hash)
      @id, @name, @data = hash['userid'], hash['name'], hash
    end
    def attendances(start_time, end_time)
      params = {workDateFrom: start_time, workDateTo: end_time, userId: @id}
      Attendance.list(**params)
    end
    def method_missing(m, *args)
      m = m.to_s
      unless @data.has_key?(m)
        @data = Service.user_get(userid: @id)
        raise "用户没有#{m}属性" unless @data.has_key?(m)
      end
      @data[m]
    end
    def to_s;@name end
  end
end
