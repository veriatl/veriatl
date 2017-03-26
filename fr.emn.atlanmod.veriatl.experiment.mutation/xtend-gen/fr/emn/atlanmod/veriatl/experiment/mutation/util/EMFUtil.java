package fr.emn.atlanmod.veriatl.experiment.mutation.util;

import java.util.ArrayList;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EClassifier;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.util.EcoreUtil;

/**
 * @author zcheng
 */
@SuppressWarnings("all")
public class EMFUtil {
  public static EObject copy(final EObject eObject) {
    final EcoreUtil.Copier copier = new EcoreUtil.Copier();
    final EObject result = copier.copy(eObject);
    copier.copyReferences();
    return result;
  }
  
  public static EPackage getEPackage(final URI uri) {
    final ResourceSetImpl rs = new ResourceSetImpl();
    final Resource res = rs.getResource(uri, true);
    EList<EObject> _contents = res.getContents();
    for (final EObject content : _contents) {
      if ((content instanceof EPackage)) {
        return ((EPackage)content);
      }
    }
    return null;
  }
  
  public static ArrayList<String> findBoolAttrs(final EPackage p, final String name) {
    ArrayList<String> res = new ArrayList<String>();
    EClassifier _eClassifier = p.getEClassifier(name);
    final EClass clazz = ((EClass) _eClassifier);
    EList<EAttribute> _eAllAttributes = clazz.getEAllAttributes();
    for (final EAttribute attr : _eAllAttributes) {
      EClassifier _eType = attr.getEType();
      String _string = _eType.toString();
      String _lowerCase = _string.toLowerCase();
      int _indexOf = _lowerCase.indexOf("bool");
      boolean _notEquals = (_indexOf != (-1));
      if (_notEquals) {
        String _name = attr.getName();
        res.add(_name);
      }
    }
    return res;
  }
}
