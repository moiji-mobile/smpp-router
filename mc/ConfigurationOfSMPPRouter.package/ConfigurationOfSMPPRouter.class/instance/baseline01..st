baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/'.
		spec project: 'Osmocom' with: [
				spec
					className: #ConfigurationOfOsmocom;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/' ].
		spec 
			package: #SMPPRouter with: [
				spec requires: #(#'SMPP-Connection' #'SMPP-Codec' ). ];
			package: #'SMPP-Codec' with: [
				spec requires: #('Osmocom' ). ];
			package: #'SMPP-Connection' with: [
				spec requires: #(#'SMPP-Codec' 'Osmocom' ). ]. ].
