initialization
initialize
	connections := OrderedCollection new.
	filter := SMPPNoFilter on: self.
	patcher := SMPPNoPatcher on: self.
	logger := LogStructuredLogger for: self area: #smppRouter.
	patchers := OrderedCollection new.

	"Stats/Counters"
	routeReqCounter := OsmoCounter initWithName: 'RouteRequest'.
	unroutableCounter := OsmoCounter initWithName: 'Unroutable'.
	responseCounter := OsmoCounter initWithName: 'Response'.
	filterCounter := OsmoCounter initWithName: 'Filter'.
	timeoutCounter := OsmoCounter initWithName: 'Timeout'.