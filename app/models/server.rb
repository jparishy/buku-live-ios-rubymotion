# RKLogInitialize()
# lcl_configure_by_name("RestKit/Network", RKLogLevelTrace);
# lcl_configure_by_name("RestKit/ObjectMapping", RKLogLevelTrace);
GET    = 0
POST   = 1
PUT    = 2
DELETE = 3

class Server
  attr_accessor :base_url

  def initialize(base_url)
    self.base_url = base_url
    RKClient.clientWithBaseURLString(base_url)
    RKClient.sharedClient.timeoutInterval = 30

    NSNotificationCenter.defaultCenter.addObserver(self, selector:"reachabilityStatusChanged:", name:RKReachabilityDidChangeNotification, object:nil)

  end

  def reachabilityStatusChanged(notification)
    if RKClient.sharedClient.reachabilityObserver.isReachabilityDetermined && RKClient.sharedClient.isNetworkReachable
      App.delegate.errorNotificationController.setNotificationTitle ""
      App.delegate.errorNotificationController.hide
    else
      App.delegate.errorNotificationController.setNotificationTitle "No Internet Connection"
      App.delegate.errorNotificationController.show
    end
  end

end

class FRequest
  attr_accessor :method, :path, :params, :delegate, :response

  def initialize(method, path, params, delegate)
    @method = method
    @path = path
    @params = params
    @delegate = delegate
    sendRequest
  end

  def sendRequest
    case @method
    when GET
      get(@path, @params, @delegate)
    when POST
      post(@path, @params, @delegate)
    else
      puts "no method"
    end
  end

  def get(path, queryParameters, delegate)
    RKClient.sharedClient.get(path, queryParameters:queryParameters, delegate:delegate)
  end

  def post(path, params, delegate)
    puts "new post"
    RKClient.sharedClient.post(path, params:params, delegate:delegate)
  end

end