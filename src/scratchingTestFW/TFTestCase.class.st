Class {
	#name : #TFTestCase,
	#superclass : #Object,
	#category : #scratchingTestFW
}

{ #category : #running }
TFTestCase class >> run [

	^ self new run
]

{ #category : #running }
TFTestCase class >> runAllTFTests [
|col|
col:=Dictionary new.
self allSubclassesDo: [:each|col at: each name put:each run  ].
^col
]

{ #category : #asserting }
TFTestCase >> assert:aTest [
aTest
ifFalse: [ ^ self error: 'Failed test' ].
^aTest 
]

{ #category : #asserting }
TFTestCase >> assertEdelta: aFloat1 and: aFloat2 [
	(aFloat1 - aFloat2) abs <= 0.001
		ifFalse: [ ^ self error: aFloat1 asString , ' is not equal to ' , aFloat2 asString ]
		ifTrue: [ ^ true ]
]

{ #category : #asserting }
TFTestCase >> assertEqual: anObject2 and: anObject1 [
	
	anObject1 = anObject2
		ifFalse: [ ^ self error: anObject2 asString  , ' is not equal to ' , anObject1 asString  ]
		ifTrue: [ ^ true ]
]

{ #category : #accessing }
TFTestCase >> run [
	| col |
	col := Dictionary new.

	(self class methods select: [ :each | each name matchesRegex: '.*Test' ])
		do: [ :each | col at: each name put: (self class new perform: each selector) ].
	^ col
]
