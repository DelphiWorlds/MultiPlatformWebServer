# MultiPlatformWebServer

## Description

A project that serves as the base for building web server functionality on supported platforms that are not normally supported, e.g. Android, iOS and Mac.

## Notes

In order to compile for mobile platforms, compiler search paths are required to be added (these have been already for this project), namely:

```
$(BDS)\source\internet
$(BDS)\source\Indy10\Core
$(BDS)\source\Indy10\Protocols
$(BDS)\source\Indy10\System
```

This is because some units are not compiled for mobile platforms, e.g. `Web.WebReq` and `IdHTTPWebBrokerBridge`


