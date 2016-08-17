module DingTalk
  class Department
    def self.list
      Service.department_list.map{|hash| new(hash)}
    end
    def self.get(id)
      new(Service.department_get(id: id))
    end
    attr_reader :id, :name, :parentid
    def initialize(hash)
      @id, @name, @parentid = hash['id'], hash['name'], hash['parentid']
    end
    def parent
      Department.get(@parentid) if @parentid
    end
    def users
      Service.user_simplelist(department_id: @id).map{|hash| User.new(hash)}
    end
    def to_s;@name end
  end
end
