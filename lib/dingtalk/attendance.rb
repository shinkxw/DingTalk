module DingTalk
  class Attendance
    def self.list(**params)
      Service.attendance_list(**params).map{|hash| new(hash)}
    end
    attr_reader :id, :userId
    def initialize(hash)
      hash.each do |k, v|
        instance_variable_set("@#{k}", v)
      end
    end
    def day;to_time(@workDate) end
    def btime;to_time(@baseCheckTime) end
    def utime;to_time(@userCheckTime) end
    def to_time(int);Time.at(int / 1000) end
  end
end
