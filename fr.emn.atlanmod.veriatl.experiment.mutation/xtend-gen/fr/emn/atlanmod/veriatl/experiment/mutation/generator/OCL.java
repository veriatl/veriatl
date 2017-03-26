package fr.emn.atlanmod.veriatl.experiment.mutation.generator;

import com.google.common.base.Objects;
import fr.emn.atlanmod.veriatl.experiment.mutation.generator.Mutation;
import java.util.Arrays;
import java.util.List;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.m2m.atl.common.OCL.BooleanExp;
import org.eclipse.m2m.atl.common.OCL.NavigationOrAttributeCallExp;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.common.OCL.OclModel;
import org.eclipse.m2m.atl.common.OCL.OclModelElement;
import org.eclipse.m2m.atl.common.OCL.OperationCallExp;
import org.eclipse.m2m.atl.common.OCL.OperatorCallExp;
import org.eclipse.m2m.atl.common.OCL.VariableDeclaration;
import org.eclipse.m2m.atl.common.OCL.VariableExp;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class OCL {
  protected static String _gen(final EObject e) {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("// We dont understand ");
    EClass _eClass = e.eClass();
    String _name = _eClass.getName();
    _builder.append(_name, "");
    return _builder.toString();
  }
  
  protected static CharSequence _gen(final OperatorCallExp e) {
    StringConcatenation _builder = new StringConcatenation();
    OclExpression _source = e.getSource();
    final CharSequence src = OCL.gen(_source);
    _builder.newLineIfNotEmpty();
    final String op = e.getOperationName();
    _builder.newLineIfNotEmpty();
    EList<OclExpression> _arguments = e.getArguments();
    final Function1<OclExpression, CharSequence> _function = new Function1<OclExpression, CharSequence>() {
      @Override
      public CharSequence apply(final OclExpression arg) {
        return OCL.gen(arg);
      }
    };
    List<CharSequence> _map = ListExtensions.<OclExpression, CharSequence>map(_arguments, _function);
    final String args = IterableExtensions.join(_map, op);
    _builder.newLineIfNotEmpty();
    String _xifexpression = null;
    boolean _equals = Objects.equal(op, "and");
    if (_equals) {
      _xifexpression = String.format("%s and %s", src, args);
    } else {
      String _xifexpression_1 = null;
      boolean _equals_1 = Objects.equal(op, "=");
      if (_equals_1) {
        _xifexpression_1 = String.format("%s = %s", src, args);
      } else {
        _xifexpression_1 = String.format("We don\'t understand operator: %s", op);
      }
      _xifexpression = _xifexpression_1;
    }
    _builder.append(_xifexpression, "");
    return _builder;
  }
  
  protected static String _gen(final NavigationOrAttributeCallExp e) {
    StringConcatenation _builder = new StringConcatenation();
    OclExpression _source = e.getSource();
    CharSequence _gen = OCL.gen(_source);
    _builder.append(_gen, "");
    _builder.append(".");
    String _name = e.getName();
    _builder.append(_name, "");
    return _builder.toString();
  }
  
  protected static String _gen(final VariableExp e) {
    StringConcatenation _builder = new StringConcatenation();
    VariableDeclaration _referredVariable = e.getReferredVariable();
    String _varName = _referredVariable.getVarName();
    _builder.append(_varName, "");
    return _builder.toString();
  }
  
  protected static String _gen(final BooleanExp e) {
    StringConcatenation _builder = new StringConcatenation();
    boolean _isBooleanSymbol = e.isBooleanSymbol();
    _builder.append(_isBooleanSymbol, "");
    return _builder.toString();
  }
  
  protected static String _gen(final OclModelElement e) {
    StringConcatenation _builder = new StringConcatenation();
    String _xifexpression = null;
    OclModel _model = e.getModel();
    boolean _tripleEquals = (_model == null);
    if (_tripleEquals) {
      _xifexpression = Mutation.src;
    } else {
      OclModel _model_1 = e.getModel();
      _xifexpression = _model_1.getName();
    }
    _builder.append(_xifexpression, "");
    _builder.append("!");
    String _name = e.getName();
    _builder.append(_name, "");
    return _builder.toString();
  }
  
  protected static String _gen(final OperationCallExp e) {
    StringConcatenation _builder = new StringConcatenation();
    OclExpression _source = e.getSource();
    final CharSequence src = OCL.gen(_source);
    _builder.newLineIfNotEmpty();
    final String op = e.getOperationName();
    _builder.newLineIfNotEmpty();
    EList<OclExpression> _arguments = e.getArguments();
    final Function1<OclExpression, CharSequence> _function = new Function1<OclExpression, CharSequence>() {
      @Override
      public CharSequence apply(final OclExpression arg) {
        return OCL.gen(arg);
      }
    };
    List<CharSequence> _map = ListExtensions.<OclExpression, CharSequence>map(_arguments, _function);
    final String args = IterableExtensions.join(_map, " ");
    _builder.newLineIfNotEmpty();
    String _xifexpression = null;
    boolean _equals = Objects.equal(op, "oclIsTypeOf");
    if (_equals) {
      _xifexpression = String.format("%s.%s(%s)", src, op, args);
    } else {
      String _xifexpression_1 = null;
      boolean _equals_1 = Objects.equal(op, "oclIsKindOf");
      if (_equals_1) {
        _xifexpression_1 = String.format("%s.%s(%s)", src, op, args);
      } else {
        _xifexpression_1 = "dont understand";
      }
      _xifexpression = _xifexpression_1;
    }
    _builder.append(_xifexpression, "");
    return _builder.toString();
  }
  
  public static CharSequence gen(final EObject e) {
    if (e instanceof OperatorCallExp) {
      return _gen((OperatorCallExp)e);
    } else if (e instanceof BooleanExp) {
      return _gen((BooleanExp)e);
    } else if (e instanceof NavigationOrAttributeCallExp) {
      return _gen((NavigationOrAttributeCallExp)e);
    } else if (e instanceof OclModelElement) {
      return _gen((OclModelElement)e);
    } else if (e instanceof OperationCallExp) {
      return _gen((OperationCallExp)e);
    } else if (e instanceof VariableExp) {
      return _gen((VariableExp)e);
    } else if (e != null) {
      return _gen(e);
    } else {
      throw new IllegalArgumentException("Unhandled parameter types: " +
        Arrays.<Object>asList(e).toString());
    }
  }
}
