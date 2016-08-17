module DingTalk
  class Attendance
    def self.list(**params)
      Service.attendance_list(**params).map{|hash| new(hash)}
    end
    attr_reader :id, :userId
    def initialize(hash)
      @id, @userId, @groupId, @planId = hash['id'], hash['userId'], hash['groupId'], hash['planId']
      @baseCheckTime, @userCheckTime = hash['baseCheckTime'], hash['userCheckTime']
      @workDate, @timeResult = hash['workDate'], hash['timeResult']
      @checkType, @locationResult = hash['checkType'], hash['locationResult']
    end
  end
end
