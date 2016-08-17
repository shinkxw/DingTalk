require 'json'
require 'rest-client'
require 'dingtalk/version'
require 'dingtalk/service'

module DingTalk
  class << self
    attr_accessor :corpid, :corpsecret, :access_token
  end
end
