system_v_configuration = YAML.load_file('config/capistrano-system-v-service.yml')['system_v_services']

class SystemVCommand
  attr_reader :name, :roles, :command

  def initialize(options = {})
    @name = options.fetch(:name)
    @roles = options.fetch(:roles) || :all
    @command = options.fetch(:command)
  end

  def description
    "#{command.capitalize} the #{name} service via system-v on #{roles} servers."
  end

  def task_name
    "service:#{name}:#{command}"
  end

  def to_s
    [:sudo, :service, name, command].join(' ')
  end
end

system_v_configuration.each do |config|
  %w(start stop restart reload status).each do |command|
    service = SystemVCommand.new(:name => config['name'], :roles => config['roles'], :command => command)
    desc service.description
    Rake::Task.define_task(service.task_name) do |t|
      on roles service.roles do
        if %w(reload status).include?(command)
          info capture(service.to_s)
        else
          execute service.to_s
        end
      end
    end
  end
end
