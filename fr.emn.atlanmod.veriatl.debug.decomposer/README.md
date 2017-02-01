Incremental Deductive Verification for Relational Model Transformations [Online]
===

Introduction
------
Re-verifying from scratch after a change is being made results low performance in deductive verification of relational model transformations. In this work, we propose an incremental approach to address this problem for the relational aspects of the ATL language. Our approach decomposes each OCL postcondition into sub-goals, and cache their verification result. Then, we explore the characteristics of relational model transformations to determine whether a change would impact the cached verification results. Consequently, less postconditions/sub-goals need to be re-verified. Moreover, when a change results the re-verification of postconditions, we aim to reduce the re-verification complexity by constructing the simplified postconditions to verify (which constructed from the cache of sub-goals using three-valued logic). We prove the soundness of our approach and demonstrate its effectiveness by mutation analysis. Our evaluation shows an approximate 50\% reuse of verification result for postconditions, and 70\% reuse of verification result for sub-goals. Consequently, we gain about 56\% reduction of verification time for postconditions, and 51\% for sub-goals.

Repository structure
------
- Prelude. The core Boogie libraries for the VeriATL verification system.
- Result. the evaluation results of our case study in text format.
- Src. The Java source code of our incremental verification approach.
- externalDependency. The external jar file required by the source code.
- correct2not / not2correct. Two evaluation settings for our case study.

How to run
------
- Executing src/incremental/evaluation.java automatically reproduces the evaluation result.

Tools required
------
The following tools are needed to reproduce the evaluation result:
- Boogie 2.2+
- Z3 4.3+

