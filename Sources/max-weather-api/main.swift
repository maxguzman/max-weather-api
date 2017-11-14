import PerfectLib
import PerfectCURL
import PerfectHTTP
import PerfectHTTPServer

let apiRoute = "/api/v1/"
let httpPort = 8080
let apiToken = "c993087e2e79564d"

var routes = Routes()

routes.add(method: .get, uris: ["\(apiRoute)current/","\(apiRoute)current/{country}/{city}"], handler: {
  request, response in
  let country = request.urlVariables["country"] ?? "Chile"
  let city = request.urlVariables["city"] ?? "Providencia"
  
  response.setHeader(.contentType, value: "application/json")
  response.appendBody(string: Weather.getCurrent("\(country)/\(city)"))
  response.completed()
})

routes.add(method: .get, uris: ["\(apiRoute)forecast","\(apiRoute)forecast/{country}/{city}"], handler: {
  request, response in
  let country = request.urlVariables["country"] ?? "Chile"
  let city = request.urlVariables["city"] ?? "Providencia"
  
  response.setHeader(.contentType, value: "application/json")
  response.appendBody(string: Weather.getForecast("\(country)/\(city)"))
  response.completed()
})

do {
  try HTTPServer.launch(
    .server(name: "Max Weather API", port: httpPort, routes: routes))
} catch {
  fatalError("\(error)")
}
