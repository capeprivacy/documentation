Module cape_privacy.spark.registry
==================================

Functions
---------

    
`get(transformation: str) -> Callable`
:   Returns the constructor for the given key.
    
    Arguments:
        transformation: The key of transformation to retrieve.

    
`register(label: str, ctor: Callable)`
:   Registers a new transformation constructor under the label provided.
    
    Arguments:
        label: The label that will be used as the key in the registry
        ctor: The transformation constructor