watchdog
watchdogProcess
	| stats |
	stats := { responseCounter. unroutableCounter. routeReqCounter. filterCounter. timeoutCounter. } collect: [:each | each counterName -> each readReset].
	logger logNotice: 'watchdog stats' with: stats.