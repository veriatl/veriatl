On Scalability of Deductive Verification for Rule-Based Model Transformations (Online)
=======

Introduction
------
In model-driven engineering, model transformation verification is essential for reliably producing software artifacts. While advancements in SMT solvers have enabled Hoare-style verification for non-trivial model transformations, scalability is one of the major issues that hamper the usage of these techniques in industry. In this paper we show that expressing the model transformation by a declarative rule-based language like ATL, allows for domain-specific deductive reasoning that can significantly improve scalability, w.r.t. to an equivalent solution in an imperative general-purpose language. In particular, we show how an automatic transformation slicing approach can be used to reduce the verification complexity/time of large scale model transformations, by aligning each correctness criterion to the ATL rules it depends on. Moreover, by domain knowledge deducted from the model transformation, we algorithmically identify the criteria that benefit from being composed in a single verification task. We provide an automated tool that implements this process. We evaluate its practical applicability on a case study, and identify its limitations.

Video
------
Interest in VeriATL, but do not have time to install? Worry not! Quick demo of VeriATL on youtube: 

[Click to watch](https://youtu.be/zFqbcK4jd9I)

Impacts
------
* Our evaluation confirms that our slicing approach can efficiently verify postconditions when a MT is scaling. 
* Moreover, our proposed algorithm can further contribute to the slicing approach to verify large-scale MTs.


Evaluation
------
The source code of the 1 case study are under **fr.emn.atlanmod.veriatl.experiment** project:
* UMLScale (UML)


Standalone Java applications are provided to automatically and incrementally verify each case study. They are under the following package:
* fr.emn.atlanmod.veriatl.experiment.UMLCopierScale


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