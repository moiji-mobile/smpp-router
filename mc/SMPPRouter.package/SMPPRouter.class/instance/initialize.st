initialization
initialize
	connections := OrderedCollection new.
	filter := SMPPNoFilter on: self.
	patcher := SMPPNoPatcher on: self.