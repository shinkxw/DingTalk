$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'dingtalk'

DingTalk.corpid = 'corpid'
DingTalk.corpsecret = 'corpsecret'

department = DingTalk::Department.list[1]
p department
user = department.users[1]
p user
attendances = user.attendances('2016-08-14 00:00:00', '2016-08-17 00:00:00')
p attendances.map(&:day)
p attendances.map(&:btime)
p attendances.map(&:utime)

