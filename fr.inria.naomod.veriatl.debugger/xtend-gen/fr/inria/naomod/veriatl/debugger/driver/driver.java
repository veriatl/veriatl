package fr.inria.naomod.veriatl.debugger.driver;

import fr.inria.naomod.veriatl.debugger.contract.ContractLoader;
import java.util.List;
import java.util.Map;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;
import org.eclipse.m2m.atl.common.ATL.ATLPackage;
import org.eclipse.m2m.atl.common.OCL.OCLPackage;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.emftvm.compiler.AtlResourceFactoryImpl;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class driver {
  /**
   * Setup EMF factories, so that corresponding resources can be load into memory.
   */
  public static Object doEMFSetup() {
    Object _xblockexpression = null;
    {
      EPackage.Registry.INSTANCE.put(ATLPackage.eNS_URI, ATLPackage.eINSTANCE);
      EPackage.Registry.INSTANCE.put(OCLPackage.eNS_URI, OCLPackage.eINSTANCE);
      Map<String, Object> _extensionToFactoryMap = Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap();
      XMIResourceFactoryImpl _xMIResourceFactoryImpl = new XMIResourceFactoryImpl();
      _extensionToFactoryMap.put("xmi", _xMIResourceFactoryImpl);
      Map<String, Object> _extensionToFactoryMap_1 = Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap();
      AtlResourceFactoryImpl _atlResourceFactoryImpl = new AtlResourceFactoryImpl();
      _extensionToFactoryMap_1.put("atl", _atlResourceFactoryImpl);
      Map<String, Object> _extensionToFactoryMap_2 = Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap();
      EcoreResourceFactoryImpl _ecoreResourceFactoryImpl = new EcoreResourceFactoryImpl();
      _xblockexpression = _extensionToFactoryMap_2.put("ecore", _ecoreResourceFactoryImpl);
    }
    return _xblockexpression;
  }
  
  /**
   * Setup VeriATL resources.
   */
  public static void doVeriATLSetup(final URI contract) {
    try {
      final ResourceSetImpl rs = new ResourceSetImpl();
      final Resource contract_resource = rs.getResource(contract, true);
      final List<OclExpression> posts = ContractLoader.findPostconditions(contract_resource);
      for (final OclExpression post : posts) {
        {
          final OclExpression temp = EcoreUtil.<OclExpression>copy(post);
          InputOutput.<OclExpression>println(temp);
        }
      }
      int _size = posts.size();
      System.out.println(_size);
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  /**
   * Set up VeriATL compiler.
   */
  public static void doSetup(final URI contract) {
    driver.doEMFSetup();
    driver.doVeriATLSetup(contract);
  }
  
  /**
   * Core compiler for VeriATL plugin.
   */
  public static void main(final String[] args) {
    final String contract = "./resources/ER2RELContract.atl";
    final URI contract_uri = URI.createFileURI(contract);
    driver.doSetup(contract_uri);
  }
}
