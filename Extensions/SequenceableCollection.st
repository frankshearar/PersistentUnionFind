
!SequenceableCollection methodsFor: '*PersistentUnionFind' stamp: 'fbs 1/2/2012 14:05'!
elementsOfClass: aParentObject
	"Given a relation from integers to integers, and given some integer aParentObject, what numbers (including aParentObject) make up this equivalence class?"
	| fakeDict |
	"An array is a dictionary mapping indices to objects. Dictionary already implements this, so to spare programmer cycles, use Dictionary's implementation."
	fakeDict := Dictionary new.
	self doWithIndex: [:element :index | fakeDict at: index put: element].
	^ fakeDict elementsOfClass: aParentObject.! !

!SequenceableCollection methodsFor: '*PersistentUnionFind' stamp: 'fbs 1/15/2012 11:50'!
keys
	"The indices known to this collection."
	^ 1 to: self size.! !
