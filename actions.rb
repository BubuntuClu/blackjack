module ActionMethods
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :actions_ar
    def actions(*args)
      self.actions_ar ||= []
      args.each { |arg| self.actions_ar << arg.to_sym }
    end
  end

  module InstanceMethods
    @actions
    attr_accessor :actions
    def action!
      self.actions = self.class.actions_ar
    end

    def what_player_can_do
      actions.each { |action_name| puts action_name.to_s.sub('_', ' ') }
    end

    def do_action(action)
      send(action)
    end
  end
end
