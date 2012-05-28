class RoutesController < ApplicationController

  def index
    @routes = Route.includes({schedules: :schedule_stops}, :stops)
    @routes.each do |route|
      route.schedules.each do |schedule|
        schedule.schedule_stops.each do |stop|
          stop['name'] = stop.stop.name unless stop.stop.nil?
        end
        schedule['train'] = schedule.train
        schedule['stops'] = schedule.schedule_stops
      end unless route.schedules.nil?
      route['scheduled_trips'] = route.schedules
    end
    render js: "#{params[:callback]}(#{@routes.to_json});"
  end

end
