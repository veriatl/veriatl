package fr.emn.atlanmod.veriatl.experiment.mutation.datastructure;

import fr.emn.atlanmod.veriatl.experiment.mutation.datastructure.Mutator;
import fr.emn.atlanmod.veriatl.experiment.mutation.util.EMFUtil;
import fr.emn.atlanmod.veriatl.experiment.mutation.util.OCLUtil;
import java.util.ArrayList;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.m2m.atl.common.ATL.InPattern;
import org.eclipse.m2m.atl.common.ATL.InPatternElement;
import org.eclipse.m2m.atl.common.ATL.MatchedRule;
import org.eclipse.m2m.atl.common.OCL.BooleanExp;
import org.eclipse.m2m.atl.common.OCL.NavigationOrAttributeCallExp;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.common.OCL.OclType;
import org.eclipse.m2m.atl.common.OCL.OperatorCallExp;
import org.eclipse.m2m.atl.common.OCL.VariableDeclaration;
import org.eclipse.m2m.atl.common.OCL.VariableExp;

/**
 * @author zcheng
 */
@SuppressWarnings("all")
public class SetGuard extends Mutator {
  public SetGuard(final MatchedRule r) {
    super(r);
  }
  
  public ArrayList<MatchedRule> apply(final EPackage mm) {
    ArrayList<MatchedRule> res = new ArrayList<MatchedRule>();
    MatchedRule _appliedOn = this.getAppliedOn();
    InPattern _inPattern = _appliedOn.getInPattern();
    EList<InPatternElement> _elements = _inPattern.getElements();
    final InPatternElement firstElem = _elements.get(0);
    OclType _type = firstElem.getType();
    final String firstElemClassName = _type.getName();
    final String firstElemName = firstElem.getVarName();
    final ArrayList<String> attrs = EMFUtil.findBoolAttrs(mm, firstElemClassName);
    for (final String attr : attrs) {
      {
        VariableExp src = OCLUtil.make.createVariableExp();
        VariableDeclaration ref = OCLUtil.make.createVariableDeclaration();
        ref.setVarName(firstElemName);
        src.setReferredVariable(ref);
        NavigationOrAttributeCallExp nav = OCLUtil.make.createNavigationOrAttributeCallExp();
        nav.setSource(src);
        nav.setName(attr);
        final BooleanExp fal = OCLUtil.make.createBooleanExp();
        fal.setBooleanSymbol(false);
        OperatorCallExp eq = OCLUtil.make.createOperatorCallExp();
        eq.setOperationName("=");
        eq.setSource(nav);
        EList<OclExpression> _arguments = eq.getArguments();
        _arguments.add(fal);
        MatchedRule _appliedOn_1 = this.getAppliedOn();
        EObject _copy = EMFUtil.copy(_appliedOn_1);
        MatchedRule clone = ((MatchedRule) _copy);
        OperatorCallExp and = OCLUtil.make.createOperatorCallExp();
        and.setOperationName("and");
        InPattern _inPattern_1 = clone.getInPattern();
        OclExpression _filter = _inPattern_1.getFilter();
        and.setSource(_filter);
        EList<OclExpression> _arguments_1 = and.getArguments();
        _arguments_1.add(eq);
        InPattern _inPattern_2 = clone.getInPattern();
        _inPattern_2.setFilter(and);
        res.add(clone);
      }
    }
    return res;
  }
}
