require "monster_mash/base"

class PaymentAPI < MonsterMash::Base

  defaults do
    base_uri 'http://localhost:4567'
  end

  get(:process) do |params|
    uri "/api/process/#{params[:mobile]}/#{params[:pin]}/1"
    handler do |response|
      JSON.parse(response.body)
    end
  end

end