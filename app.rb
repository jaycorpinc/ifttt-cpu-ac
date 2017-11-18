require 'rubygems'
require 'httparty'

module IFTTT
	class Trigger
			def self.event event_name
				key=''
				url="https://maker.ifttt.com/trigger/#{event_name}/with/key/#{key}"
				HTTParty.get(url)
			end
	end
end


module LinuxSensors
	class Core
		def self.turn_ac_on?
			turn_ac_on=false
			`sensors`.each_line do |line|
				if line.include?("Core")
					line_temp = line.split("+")[1].split("°")[0].to_f 
					if line_temp.to_f > 70
						turn_ac_on=true
					end
				end
			end
			return turn_ac_on
		end
	end
end


IFTTT::Trigger.event('office_cold') unless LinuxSensors::Core.turn_ac_on?
IFTTT::Trigger.event('office_hot') if LinuxSensors::Core.turn_ac_on?
