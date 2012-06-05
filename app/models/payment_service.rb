class PaymentService
  include HTTParty
  base_uri 'http://localhost:4567'

  def process(params)
    params[:amount] = 1
    options = { :body => params }
    response = self.class.post('/api/process.json', options)
    JSON.parse(response.body)
  end
end