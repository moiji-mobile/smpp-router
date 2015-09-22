versions
version1: spec
	<version: '1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1'.
		spec author: 'HolgerHansPeterFreyther'.
		spec timestamp: '9/22/2015 19:36'.
		spec 
			project: 'RFB' with: '0.62';
			project: 'SMPP' with: '0.1-baseline';
			project: 'OsmoLogging' with: '0.1-baseline';
			project: 'VoyageMongo' with: '1.3.1';
			project: 'ZincHTTPComponents' with: '2.6.6'.
		spec package: #SMPPRouter with: 'SMPPRouter-HolgerHansPeterFreyther.31'. ].
