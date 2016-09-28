as yet unclassified
baseline: spec
	<baseline>

	spec for: #'common' do: [
	spec 
			project: 'RFB' with: [
				spec
					className: #ConfigurationOfRFB;
					versionString: '0.62';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/RFB/main/' ];
			baseline: 'SMPP' with: [
				spec repository: 'github://moiji-mobile/smpp-codec:release-10/mc' ];
			project: 'OsmoLogging' with: [
				spec
					className: #ConfigurationOfOsmoLogging;
					versionString: '2';
					repository: 'http://smalltalkhub.com/mc/osmocom/Logging/main/' ];
			project: 'VoyageMongo' with: [
				spec
					className: #ConfigurationOfVoyageMongo;
					versionString: '1.3.1';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'ZincHTTPComponents' with: [
				spec
					className: #ConfigurationOfZincHTTPComponents;
					versionString: '2.6.7';
					loads: #('REST' );
					repository: 'http://mc.stfx.eu/ZincHTTPComponents/' ];
			project: 'StatsDClient' with: [
				spec
					className: #ConfigurationOfStatsDClient;
					versionString: '3';
					repository: 'http://smalltalkhub.com/mc/hfreyther2/StatsD/main/' ].
		spec package: #SMPPRouter with: [
				spec requires: #('SMPP' 'OsmoLogging' 'VoyageMongo' 'ZincHTTPComponents' 'StatsDClient' ). ].
		spec group: 'default' with: #(#SMPPRouter 'RFB' ). 
	]