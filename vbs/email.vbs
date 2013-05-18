Set oShell = CreateObject( "WScript.Shell" )
Set objMessage = CreateObject("CDO.Message")
comp=oShell.ExpandEnvironmentStrings("%ComputerName%")
objMessage.Subject = "(subject)"
objMessage.From = "(Name)"
objMessage.To = "(to)"
objMessage.cc = "" 
objMessage.Bcc = "" 
objMessage.TextBody = "(body)"
objMessage.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
objMessage.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "(server)"
objMessage.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
objMessage.Configuration.Fields.Update
objMessage.Send