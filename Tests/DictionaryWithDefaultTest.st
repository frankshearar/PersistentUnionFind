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

!DictionaryWithDefaultTest methodsFor: 'testing - accessing' stamp: 'fbs 1/15/2012 11:32'!
testKeysReturnsCollectionOfKnownValues
	| d |
	d := DictionaryWithDefault wrapping: (Dictionary newFromPairs: #(1 2 3 4)) default: #yourself.
	self assert: #(1 3) equals: d keys.! !

!DictionaryWithDefaultTest methodsFor: 'testing - accessing' stamp: 'fbs 1/15/2012 11:32'!
testKeysReturnsEmptyCollectionForEmptyDictionary
	| d |
	d := DictionaryWithDefault wrapping: (Dictionary new) default: #yourself.
	self assert: #() equals: d keys.! !


!DictionaryWithDefaultTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/10/2012 22:32'!
testDoRunsOverValues
	| c dict d |
	d := Dictionary new.
	d at: 1 put: 2.
	d at: 3 put: 4.
	dict := DictionaryWithDefault wrapping: d default: [:i | Error signal: 'Block shouldn''t be run'].
	
	c := OrderedCollection new.
	dict do: [:v | c add: v].
	self assert: #(2 4) equals: c asArray.! !

!DictionaryWithDefaultTest methodsFor: 'testing - enumerating' stamp: 'fbs 1/10/2012 22:41'!
testInjectIntoFoldsValues
	| dict d |
	d := Dictionary new.
	d at: 1 put: 2.
	d at: 3 put: 4.
	d at: 5 put: 6.
	dict := DictionaryWithDefault wrapping: d default: [:i | Error signal: 'Block shouldn''t be run'].

	self assert: (2 * 4 * 6) equals: (dict inject: 1 into: [:acc :each | acc * each]).! !


!DictionaryWithDefaultTest methodsFor: 'testing - instance creation' stamp: 'fbs 12/30/2011 23:09'!
testCanWrapNormalDictionary
	DictionaryWithIdentity wrapping: Dictionary new default: #yourself.! !


!DictionaryWithDefaultTest methodsFor: 'testing - printing' stamp: 'fbs 1/10/2012 22:41'!
testPrintPrintsLikeUnderlyingDictionary
	| dict d |
	d := Dictionary new.
	d at: 1 put: 2.
	d at: 3 put: 4.
	d at: 5 put: 6.
	dict := DictionaryWithDefault wrapping: d default: [:i | Error signal: 'Block shouldn''t be run'].
	
	self assert: 'DictionaryWithDefault(1->2 3->4 5->6 )' equals: dict printString.! !


!DictionaryWithDefaultTest methodsFor: 'testing - testing' stamp: 'fbs 12/31/2011 15:35'!
testIncludesActsAsWrappedDictionary
	| d |
	d := DictionaryWithDefault wrapping: (Dictionary newFromPairs: #(1 2 3 4)) default: [:unused | 1].
	self assert: (d includes: 1).
	self deny: (d includes: 2).! !
