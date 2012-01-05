Object subclass: #ArrayPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind'!

!ArrayPart methodsFor: 'converting' stamp: 'fbs 12/29/2011 11:17'!
asArray
	self subclassResponsibility.! !


!ArrayPart methodsFor: 'testing' stamp: 'fbs 12/29/2011 11:16'!
isDiff
	^ false.! !
