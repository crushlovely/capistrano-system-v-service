upstart_configuration = YAML.load_file('config/capistrano-system-v.yml')['upstart_services']

def system_v_description(command, service)
  "#{command.capitalize} the #{service['name']} service via system-v on #{service['roles']} servers."
end

system_v_configuration.each do |service|
  %w(start stop restart).each do |command|
    desc system_v_description(command, service)
    Rake::Task.define_task("#{service['name']}:#{command}") do |t|
      on roles (service['roles'] || :all) do
        execute :sudo, :service, service['name'], command
      end
    end
  end

  %w(reload status).each do |command|
    desc system_v_description(command, service)
    Rake::Task.define_task("#{service['name']}:#{command}") do |t|
      on roles (service['roles'] || :all) do
        info capture("sudo service #{service['name']} #{command}")
      end
    end
  end
end
