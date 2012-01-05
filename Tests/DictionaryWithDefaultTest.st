TestCase subclass: #DictionaryWithDefaultTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind-Tests'!

!DictionaryWithDefaultTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 23:03'!
testAtForKnownKeyReturnsMappedValue
	| d |
	d := DictionaryWithDefault wrapping: (Dictionary newFromPairs: #(1 2)) default: #yourself.
	self assert: 2 equals: (d at: 1).! !

!DictionaryWithDefaultTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 23:05'!
testAtForUnknownKeyReturnsPluggableValue
	| d |
	d := DictionaryWithIdentity wrapping: Dictionary new default: [:key | key + 1].
	self assert: 2 equals: (d at: 1).
	self assert: 3 equals: (d at: 2).! !

!DictionaryWithDefaultTest methodsFor: 'testing - accessing' stamp: 'fbs 12/30/2011 23:09'!
testAtPutStoresMappedValue
	| d |
	d := DictionaryWithIdentity wrapping: Dictionary new default: #yourself.
	d at: 1 put: 2.
	self assert: 2 equals: (d at: 1).! !


!DictionaryWithDefaultTest methodsFor: 'testing - instance creation' stamp: 'fbs 12/30/2011 23:09'!
testCanWrapNormalDictionary
	DictionaryWithIdentity wrapping: Dictionary new default: #yourself.! !


!DictionaryWithDefaultTest methodsFor: 'testing - testing' stamp: 'fbs 12/31/2011 15:35'!
testIncludesActsAsWrappedDictionary
	| d |
	d := DictionaryWithDefault wrapping: (Dictionary newFromPairs: #(1 2 3 4)) default: [:unused | 1].
	self assert: (d includes: 1).
	self deny: (d includes: 2).! !
