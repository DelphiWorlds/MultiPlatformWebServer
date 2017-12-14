object WebServerModule: TWebServerModule
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModuleDefaultHandlerAction
    end>
  Height = 230
  Width = 415
end
