FOR %%i IN (model/*) DO (
java -jar ModelExtractor.jar model/ %%i ../workspace/veriatl.compiler.cs.nuim.ie/src/metamodel/ATL.ecore outputs/
)
PAUSE