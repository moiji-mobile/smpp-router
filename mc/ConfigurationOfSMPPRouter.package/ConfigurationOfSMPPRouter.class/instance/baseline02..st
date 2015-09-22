baselines
baseline02: spec
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/SMPPRouter/main/'.
		spec 
			project: 'RFB' with: [
				spec
					className: #ConfigurationOfRFB;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/RFB/main/' ];
			project: 'SMPP' with: [
				spec
					className: #ConfigurationOfSMPP;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/SMPP/main/' ];
			project: 'OsmoLogging' with: [
				spec
					className: #ConfigurationOfOsmoLogging;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Logging/main/' ];
			project: 'VoyageMongo' with: [
				spec
					className: #ConfigurationOfVoyageMongo;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'ZincHTTPComponents' with: [
				spec
					className: #ConfigurationOfZincHTTPComponents;
					versionString: #'stable';
					loads: #('REST' );
					repository: 'http://mc.stfx.eu/ZincHTTPComponents/' ];
			project: 'StatsDClient' with: [
				spec
					className: #ConfigurationOfStatsDClient;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hfreyther2/StatsD/main/' ].
		spec package: #SMPPRouter with: [
				spec requires: #('SMPP' 'OsmoLogging' 'VoyageMongo' 'ZincHTTPComponents' 'StatsDClient' ). ].
		spec group: 'default' with: #(#SMPPRouter 'RFB' ). ].
