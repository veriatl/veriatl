package fr.emn.atlanmod.veriatl.experiment.mutation.datastructure;

import org.eclipse.m2m.atl.common.ATL.MatchedRule;

/**
 * @author zcheng
 */
@SuppressWarnings("all")
public abstract class Mutator {
  private MatchedRule appliedOn;
  
  public Mutator(final MatchedRule r) {
    this.appliedOn = r;
  }
  
  public MatchedRule getAppliedOn() {
    return this.appliedOn;
  }
}
