baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/SMPPRouter/main/'.
		spec 
			project: 'RFB' with: [
				spec
					className: #ConfigurationOfRFB;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/RFB/main/' ].
		spec 
			package: #'SMPP-Codec' with: [
				spec requires: #('Osmocom' ). ];
			package: #'SMPP-Connection' with: [
				spec requires: #(#'SMPP-Codec' 'Osmocom' ). ];
			package: #SMPPRouter with: [
				spec requires: #(#'SMPP-Connection' #'SMPP-Codec' ). ]. ].
