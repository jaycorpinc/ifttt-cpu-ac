require 'rubygems'
require 'httparty'
require 'daemons'

module IFTTT
	class Trigger
			def self.event event_name
				key=ENV['IFTTT_KEY']
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
				turn_ac_on = true if (line.include?("Core") && (line.split("+")[1].split("°")[0].to_f > 72)) 
			end
			turn_ac_on
		end
	end
end

Daemons.run_proc('proctemp.rb') do
	loop do
		ac_status=LinuxSensors::Core.turn_ac_on?
		puts "AC: #{ac_status}"
		IFTTT::Trigger.event('office_cold') unless ac_status
		IFTTT::Trigger.event('office_hot') if ac_status
		sleep 300 unless ac_status
		sleep 30 if ac_status
	end
end	
