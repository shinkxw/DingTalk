module DingTalk
  module Service
    GATEWAY_URL = 'https://oapi.dingtalk.com'
    module_function
    #获取部门列表
    def department_list
      get_result('department/list')['department']
    end
    #考勤打卡数据 userId workDateFrom:yyyy-MM-dd hh:mm:ss workDateTo:yyyy-MM-dd hh:mm:ss
    def attendance_list(**params)
      get_result('attendance/list', params, :post)['recordresult']
    end
    #获取AccessToken corpid corpsecret
    def get_token(corpid, corpsecret)
      params = {:corpid => corpid, :corpsecret => corpsecret}
      get_result('gettoken', params, add_token: false)['access_token']
    end
    
    def get_result(url, params = {}, method = :get, add_token: true)
      request_url = "#{GATEWAY_URL}/#{url}"
      request_url += "?access_token=#{access_token}" if add_token
      response = get_response(request_url, method, params)
      #~ puts response.request.url
      result = JSON.parse(response.to_str)
      puts "#{url}: #{result}" if result['errcode'] != 0
      result
    end
    def get_response(url, method, params)
      case method
      when :get
        RestClient.get(url, {:params => params})
      when :post
        json = params.to_json
        RestClient.post(url, json, {'Content-Type' => 'application/json'})
      else
      end
    end
    def access_token
      DingTalk.access_token ||= get_access_token
    end
    def get_access_token
      if DingTalk.corpid && DingTalk.corpsecret
        get_token(DingTalk.corpid, DingTalk.corpsecret)
      else
        raise "请设置DingTalk的corpid与corpsecret参数"
      end
    end
  end
end
