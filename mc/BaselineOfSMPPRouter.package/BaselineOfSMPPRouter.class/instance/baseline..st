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
	].

	spec for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x') do: [
		spec baseline: 'VoyageMongo' with: [
			spec repository: 'github://zecke/voyage-stable:1.3.1-patch/mc' ].
		spec package: #SMPPRouter with: [
			spec requires: #('SMPP' 'OsmoLogging' 'VoyageMongo' 'ZincHTTPComponents' 'StatsDClient')].
		spec group: 'default' with: #(#SMPPRouter 'RFB' )].
	spec for: #'pharo6.x' do: [
		spec baseline: 'Voyage' with: [
			spec
				repository: 'github://pharo-nosql/voyage:master/mc';
				loads: #('mongo tests') ].
		spec package: #SMPPRouter with: [
			spec requires: #('SMPP' 'OsmoLogging' 'Voyage' 'ZincHTTPComponents' 'StatsDClient')].
		spec group: 'default' with: #(#SMPPRouter 'RFB' )].

