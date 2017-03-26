package fr.emn.atlanmod.veriatl.experiment.mutation.datastructure;

import fr.emn.atlanmod.veriatl.experiment.mutation.datastructure.Mutator;
import fr.emn.atlanmod.veriatl.experiment.mutation.util.EMFUtil;
import fr.emn.atlanmod.veriatl.experiment.mutation.util.OCLUtil;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.ATL.Binding;
import org.eclipse.m2m.atl.common.ATL.InPattern;
import org.eclipse.m2m.atl.common.ATL.MatchedRule;
import org.eclipse.m2m.atl.common.ATL.OutPattern;
import org.eclipse.m2m.atl.common.ATL.OutPatternElement;
import org.eclipse.m2m.atl.common.OCL.BooleanExp;

/**
 * @author zcheng
 */
@SuppressWarnings("all")
public class Add extends Mutator {
  public Add(final MatchedRule r) {
    super(r);
  }
  
  public MatchedRule apply() {
    MatchedRule _appliedOn = this.getAppliedOn();
    EObject _copy = EMFUtil.copy(_appliedOn);
    MatchedRule clone = ((MatchedRule) _copy);
    OutPattern _outPattern = clone.getOutPattern();
    EList<OutPatternElement> _elements = _outPattern.getElements();
    for (final OutPatternElement out : _elements) {
      EList<Binding> _bindings = out.getBindings();
      _bindings.clear();
    }
    BooleanExp bool = OCLUtil.make.createBooleanExp();
    bool.setBooleanSymbol(false);
    InPattern _inPattern = clone.getInPattern();
    _inPattern.setFilter(bool);
    String _name = clone.getName();
    String _plus = (_name + "_mutated");
    clone.setName(_plus);
    return clone;
  }
}
