Parameters
------
Before running VeriATL, set the following property in the ant script:
* projName: the project name under verification.
* mode: basic/plus. Chose *plus* if want to enable fault localization capability. 
* post: which postcondition of the project want to be verify.





Tasks
------
There are several task can be executed by this ant script:
* skeleton: create a project skeleton with the specified *projName*, so that the user can put the source code of the project under verification easily.
* gen: generate Boogie code for the metamodel/pre/post/atl.
* decompose: on top of *gen*, also generate Boogie code for sub-goals of the given postcondition to perform fault localization.
* verify: verify the given postcondition.
* debug: if the postcondition failed, this option verify the sub-goals of the postcondition, and generate proof tree, to localize the bug.
* clean: clean the skeleton generated for the project. 