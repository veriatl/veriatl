package fr.emn.atlanmod.veriatl.experiment.mutation.datastructure;

import fr.emn.atlanmod.veriatl.experiment.mutation.datastructure.Mutator;
import fr.emn.atlanmod.veriatl.experiment.mutation.util.EMFUtil;
import java.util.ArrayList;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.ATL.Binding;
import org.eclipse.m2m.atl.common.ATL.MatchedRule;
import org.eclipse.m2m.atl.common.ATL.OutPattern;
import org.eclipse.m2m.atl.common.ATL.OutPatternElement;
import org.eclipse.m2m.atl.common.ATL.SimpleOutPatternElement;

/**
 * @author zcheng
 */
@SuppressWarnings("all")
public class Bind extends Mutator {
  public Bind(final MatchedRule r) {
    super(r);
  }
  
  public ArrayList<MatchedRule> apply() {
    ArrayList<MatchedRule> res = new ArrayList<MatchedRule>();
    MatchedRule _appliedOn = this.getAppliedOn();
    OutPattern _outPattern = _appliedOn.getOutPattern();
    final EList<OutPatternElement> trgs = _outPattern.getElements();
    for (final OutPatternElement trg : trgs) {
      {
        final SimpleOutPatternElement sTrg = ((SimpleOutPatternElement) trg);
        final int trgId = trgs.indexOf(trg);
        EList<Binding> _bindings = sTrg.getBindings();
        for (final Binding b : _bindings) {
          {
            MatchedRule _appliedOn_1 = this.getAppliedOn();
            EObject _copy = EMFUtil.copy(_appliedOn_1);
            MatchedRule clone = ((MatchedRule) _copy);
            EList<Binding> _bindings_1 = sTrg.getBindings();
            final int bid = _bindings_1.indexOf(b);
            OutPattern _outPattern_1 = clone.getOutPattern();
            EList<OutPatternElement> _elements = _outPattern_1.getElements();
            OutPatternElement _get = _elements.get(trgId);
            EList<Binding> _bindings_2 = _get.getBindings();
            _bindings_2.remove(bid);
            res.add(clone);
          }
        }
      }
    }
    return res;
  }
}
