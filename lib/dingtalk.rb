require 'json'
require 'rest-client'
require 'dingtalk/version'
require 'dingtalk/service'
require 'dingtalk/department'
require 'dingtalk/user'
require 'dingtalk/attendance'

module DingTalk
  class << self
    attr_accessor :corpid, :corpsecret, :access_token
  end
end
