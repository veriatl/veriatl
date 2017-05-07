Fine-Grained Incrementality for Deductive Verification of Model Transformations (Online)
=======

Introduction
------
In model-driven engineering, correct model transformation is essential for reliably producing the artifacts that drive software development. While the advancement of SMT solvers has enabled verifying the correctness of model transformations, scalability is one of the major issues that prevents its usage in industrial level. To improve this situation, we present an automatic approach for the ATL model transformation language. Specifically, we propose a transformation slicing approach to manage large scale model transformations by aligning each correctness criterion to the ATL rules it depends on, thereby reducing the verification complexity/time of individual criterion. Moreover, we manage large scale correctness criteria by proposing an algorithm to determine when the criteria should be separately or compositionally verified, thereby further improving proposed slicing approach. We provide an automated tool that implements this process. We evaluate its practical applicability on one case study, and identify its limitations.


Video
------
Interest in VeriATL, but do not have time to install? Worry not! Quick demo of VeriATL on youtube: 

[Click to watch](https://youtu.be/zFqbcK4jd9I)

Impacts
------
TODO:


Evaluation
------
The source code of the 1 case study are under **fr.emn.atlanmod.veriatl.experiment** project:
* UMLScale (UML)


Standalone Java applications are provided to automatically and incrementally verify each case study. They are under the following package:
* fr.emn.atlanmod.veriatl.experiment.UMLScale

TODO:
The result we obtained from this evaluation is under the **Result** of the **fr.emn.atlanmod.veriatl.experiment** project.


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