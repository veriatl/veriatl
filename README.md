A deductive approach for fault localization in ATL model transformations (Online)
=======

Introduction
------
In model-driven engineering, correct model transformation is essential for reliably producing the artefacts that drive software development. While correctness of model transformation can be specified and checked via contracts, existing approaches do not help to find the precise location of faults that cause the verification failure. We present a fault localization approach, based on natural deduction, for the ATL model transformation language. We start by designing sound natural deduction rules for the ATL language. Then, we propose an automated proof strategy that applies the designed deduction rules on the input OCL postcondition to generate sub-goals: successfully proving the sub-goals implies the satisfaction of the input OCL postcondition. When a sub-goal is not verified, we present the user with sliced ATL model transformation and predicates deduced from the input postcondition as debugging clues. The goal is to alleviate the cognitive loading of debugging unverified sub-goals. We present here the artefects used in the evaluation for our fault localization approach.


Video
------
Interest in how it works, but do not have time to install? Worry not! Quick demo of our tool VeriATL on youtube: 

[Click to watch](https://youtu.be/zFqbcK4jd9I)

Impacts
------
Our evaluation observes three items that would impact fault localization for ATL transformations:
* The guilty construct(s) is presented in the slice. 
* Deduced clues assist developers in various debugging tasks (e.g. generate counter-example). 
* The number of sub-goals that need to be examined to pinpoint a fault are usually small.

Evaluation
------
To help reproducing the evaluation result, the following artefacts are generated [(portal)]{}:
* HSM2FSM / AF2 / AR / DB1 / DR1 / MB6 / MF6 / MT2. Each of these folders contains all the Boogie code to verify each postcondition and localize its fault for a given project. Within each folder, we have three kinds of artefacts:
  * Auxu. The corresponding Boogie code of the case study.
  * Sub-goals. The Boogie code of the sub-goals / original postcondition.
  * Source. The source code for metamodels, model transformations, contracts and etc.
  * The first two kinds of artefacts are generated in advance by using VeriATL. In case the user wants to try VeriATL themselves, the user can use the source code of this repository [(portal)]{} to load VeriATL plugin within Eclipse.
* Prelude. The core Boogie libraries for the VeriATL verification system.
* Exec. *Run this python script to reproduce the evaluation results.*
* Result. the evaluation results of the orignal and mutated HSM2FSM case study in text format.

Requirements
------
VeriATL is an Eclipse-plugin. It is developed on top of Eclipse Modelling Project (Neon), and requires the following external plugin-dependencies to build / be functional:
* EMFTVM v.3.8
* Xtend v.2.10


Contacts
------
> Zheng Cheng: zheng.cheng@inria.fr

> Massimo Tisi: massimo.tisi@inria.fr

Collaborators
------
* Rosemary Monahan, Maynooth Univerisity, IE
* James F. Power, Maynooth Univerisity, IE