## HTTPClient
Usage of HTTPClient to request resources via HTTP and
HTTPS protocols.
### Description
The sample provides a performHttpGetRequest() method which will be invoked with
two sample URLs. The content available at these URLs will then be fetched. If
an URL starts with https:// a secure connection will automatically be
established and the peer side's certificate will be validated against a list
of known, trusted authorities by default. The validation can be disabled but
this makes the connection a lot less secure.
### How to Run
Deploy the app to any device capable of HTTP(S) (use app assurance to validate)
and run it. Depending on your network configuration it might be necessary to
provide HTTP proxy settings (see source code). This app also runs on the
FullFeatured emulator.
### Implementation
There are some commented out sections giving hints to additional configuration
options

### Topics
System, Communication, Sample, SICK-AppSpace