TestCase subclass: #DictionaryWithIdentityTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind-Tests'!

!DictionaryWithIdentityTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 08:07'!
testAtForKnownKeyReturnsMappedValue
	| d |
	d := DictionaryWithIdentity wrapping: (Dictionary newFromPairs: #(1 2)).
	self assert: 2 equals: (d at: 1).! !

!DictionaryWithIdentityTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 08:10'!
testAtForUnknownKeyReturnsKey
	| d |
	d := DictionaryWithIdentity wrapping: Dictionary new.
	self assert: 1 equals: (d at: 1).
	self assert: 2 equals: (d at: 2).! !

!DictionaryWithIdentityTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 08:08'!
testAtPutStoresMappedValue
	| d |
	d := DictionaryWithIdentity wrapping: Dictionary new.
	d at: 1 put: 2.
	self assert: 2 equals: (d at: 1).! !


!DictionaryWithIdentityTest methodsFor: 'testing - instance creation' stamp: 'fbs 12/30/2011 08:01'!
testCanWrapNormalDictionary
	DictionaryWithIdentity wrapping: Dictionary new.! !
