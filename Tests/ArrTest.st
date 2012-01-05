TestCase subclass: #ArrTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PersistentUnionFind-Tests'!

!ArrTest methodsFor: 'testing - converting' stamp: 'fbs 12/28/2011 12:38'!
testAsArrayReturnsArray
	self assert: #(1 2 3) equals: (Arr wrapping: #(1 2 3)) asArray.! !
