package fr.emn.atlanmod.veriatl.experiment.mutation.generator;

import fr.emn.atlanmod.veriatl.experiment.mutation.generator.OCL;
import java.util.Arrays;
import java.util.List;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.m2m.atl.common.ATL.Binding;
import org.eclipse.m2m.atl.common.ATL.InPattern;
import org.eclipse.m2m.atl.common.ATL.InPatternElement;
import org.eclipse.m2m.atl.common.ATL.MatchedRule;
import org.eclipse.m2m.atl.common.ATL.Module;
import org.eclipse.m2m.atl.common.ATL.ModuleElement;
import org.eclipse.m2m.atl.common.ATL.OutPattern;
import org.eclipse.m2m.atl.common.ATL.OutPatternElement;
import org.eclipse.m2m.atl.common.ATL.SimpleInPatternElement;
import org.eclipse.m2m.atl.common.ATL.SimpleOutPatternElement;
import org.eclipse.m2m.atl.common.OCL.OclExpression;
import org.eclipse.m2m.atl.common.OCL.OclModel;
import org.eclipse.m2m.atl.common.OCL.OclModelElement;
import org.eclipse.m2m.atl.common.OCL.OclType;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class Mutation {
  public static String src = "";
  
  public static String trg = "";
  
  public static String SetGuard(final Module m, final MatchedRule src, final MatchedRule mutant) {
    StringConcatenation _builder = new StringConcatenation();
    CharSequence _header = Mutation.header(m);
    _builder.append(_header, "");
    _builder.newLineIfNotEmpty();
    _builder.newLine();
    {
      EList<ModuleElement> _elements = m.getElements();
      for(final ModuleElement e : _elements) {
        {
          if ((e != src)) {
            CharSequence _rule = Mutation.rule(e);
            _builder.append(_rule, "");
          } else {
            CharSequence _rule_1 = Mutation.rule(mutant);
            _builder.append(_rule_1, "");
          }
        }
        _builder.newLineIfNotEmpty();
      }
    }
    return _builder.toString();
  }
  
  public static String Del(final Module m, final MatchedRule src) {
    StringConcatenation _builder = new StringConcatenation();
    CharSequence _header = Mutation.header(m);
    _builder.append(_header, "");
    _builder.newLineIfNotEmpty();
    _builder.newLine();
    {
      EList<ModuleElement> _elements = m.getElements();
      for(final ModuleElement e : _elements) {
        {
          if ((e != src)) {
            CharSequence _rule = Mutation.rule(e);
            _builder.append(_rule, "");
          }
        }
        _builder.newLineIfNotEmpty();
      }
    }
    return _builder.toString();
  }
  
  public static String Bind(final Module m, final MatchedRule src, final MatchedRule mutant) {
    StringConcatenation _builder = new StringConcatenation();
    CharSequence _header = Mutation.header(m);
    _builder.append(_header, "");
    _builder.newLineIfNotEmpty();
    _builder.newLine();
    {
      EList<ModuleElement> _elements = m.getElements();
      for(final ModuleElement e : _elements) {
        {
          if ((e != src)) {
            CharSequence _rule = Mutation.rule(e);
            _builder.append(_rule, "");
          } else {
            CharSequence _rule_1 = Mutation.rule(mutant);
            _builder.append(_rule_1, "");
          }
        }
        _builder.newLineIfNotEmpty();
      }
    }
    return _builder.toString();
  }
  
  public static String Add(final Module m, final MatchedRule src, final MatchedRule mutant) {
    StringConcatenation _builder = new StringConcatenation();
    CharSequence _header = Mutation.header(m);
    _builder.append(_header, "");
    _builder.newLineIfNotEmpty();
    CharSequence _rule = Mutation.rule(mutant);
    _builder.append(_rule, "");
    _builder.newLineIfNotEmpty();
    {
      EList<ModuleElement> _elements = m.getElements();
      for(final ModuleElement e : _elements) {
        CharSequence _rule_1 = Mutation.rule(e);
        _builder.append(_rule_1, "");
        _builder.newLineIfNotEmpty();
      }
    }
    return _builder.toString();
  }
  
  public static CharSequence header(final Module m) {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("-- @atlcompiler emftvm");
    _builder.newLine();
    _builder.newLine();
    _builder.append("module ");
    String _name = m.getName();
    _builder.append(_name, "");
    _builder.append(";");
    _builder.newLineIfNotEmpty();
    _builder.append("create ");
    EList<OclModel> _outModels = m.getOutModels();
    OclModel _get = _outModels.get(0);
    String _name_1 = _get.getName();
    _builder.append(_name_1, "");
    _builder.append(": ");
    EList<OclModel> _outModels_1 = m.getOutModels();
    OclModel _get_1 = _outModels_1.get(0);
    OclModel _metamodel = _get_1.getMetamodel();
    String _name_2 = _metamodel.getName();
    _builder.append(_name_2, "");
    _builder.append(" from ");
    EList<OclModel> _inModels = m.getInModels();
    OclModel _get_2 = _inModels.get(0);
    String _name_3 = _get_2.getName();
    _builder.append(_name_3, "");
    _builder.append(": ");
    EList<OclModel> _inModels_1 = m.getInModels();
    OclModel _get_3 = _inModels_1.get(0);
    OclModel _metamodel_1 = _get_3.getMetamodel();
    String _name_4 = _metamodel_1.getName();
    _builder.append(_name_4, "");
    _builder.append(";");
    _builder.newLineIfNotEmpty();
    _builder.append("\t");
    _builder.newLine();
    return _builder;
  }
  
  protected static CharSequence _rule(final ModuleElement e) {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("We dont understand ");
    EClass _eClass = e.eClass();
    String _name = _eClass.getName();
    _builder.append(_name, "");
    _builder.newLineIfNotEmpty();
    return _builder;
  }
  
  protected static CharSequence _rule(final MatchedRule e) {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("rule ");
    String _name = e.getName();
    _builder.append(_name, "");
    _builder.append("{");
    _builder.newLineIfNotEmpty();
    _builder.append("\t");
    _builder.append("from");
    _builder.newLine();
    _builder.append("\t  ");
    InPattern _inPattern = e.getInPattern();
    EList<InPatternElement> _elements = _inPattern.getElements();
    final Function1<InPatternElement, CharSequence> _function = new Function1<InPatternElement, CharSequence>() {
      @Override
      public CharSequence apply(final InPatternElement in) {
        return Mutation.inPattern(((SimpleInPatternElement) in));
      }
    };
    List<CharSequence> _map = ListExtensions.<InPatternElement, CharSequence>map(_elements, _function);
    String _join = IterableExtensions.join(_map, ",");
    _builder.append(_join, "\t  ");
    _builder.newLineIfNotEmpty();
    _builder.append("\t  ");
    _builder.append("(");
    InPattern _inPattern_1 = e.getInPattern();
    OclExpression _filter = _inPattern_1.getFilter();
    CharSequence _filter_1 = Mutation.filter(_filter);
    _builder.append(_filter_1, "\t  ");
    _builder.append(")");
    _builder.newLineIfNotEmpty();
    _builder.append("\t");
    _builder.append("to");
    _builder.newLine();
    _builder.append("\t  ");
    OutPattern _outPattern = e.getOutPattern();
    EList<OutPatternElement> _elements_1 = _outPattern.getElements();
    final Function1<OutPatternElement, CharSequence> _function_1 = new Function1<OutPatternElement, CharSequence>() {
      @Override
      public CharSequence apply(final OutPatternElement in) {
        return Mutation.outPattern(((SimpleOutPatternElement) in));
      }
    };
    List<CharSequence> _map_1 = ListExtensions.<OutPatternElement, CharSequence>map(_elements_1, _function_1);
    String _join_1 = IterableExtensions.join(_map_1, ",");
    _builder.append(_join_1, "\t  ");
    _builder.newLineIfNotEmpty();
    _builder.append("}");
    _builder.newLine();
    _builder.newLine();
    return _builder;
  }
  
  public static CharSequence filter(final OclExpression expr) {
    StringConcatenation _builder = new StringConcatenation();
    CharSequence _gen = OCL.gen(expr);
    _builder.append(_gen, "");
    return _builder;
  }
  
  public static CharSequence inPattern(final SimpleInPatternElement in) {
    StringConcatenation _builder = new StringConcatenation();
    OclType _type = in.getType();
    OclModelElement tp = ((OclModelElement) _type);
    _builder.newLineIfNotEmpty();
    String _varName = in.getVarName();
    _builder.append(_varName, "");
    _builder.append(" : ");
    _builder.append(Mutation.src, "");
    _builder.append("!");
    String _name = tp.getName();
    _builder.append(_name, "");
    _builder.newLineIfNotEmpty();
    return _builder;
  }
  
  public static CharSequence outPattern(final SimpleOutPatternElement out) {
    StringConcatenation _builder = new StringConcatenation();
    OclType _type = out.getType();
    OclModelElement tp = ((OclModelElement) _type);
    _builder.newLineIfNotEmpty();
    String _varName = out.getVarName();
    _builder.append(_varName, "");
    _builder.append(" : ");
    _builder.append(Mutation.trg, "");
    _builder.append("!");
    String _name = tp.getName();
    _builder.append(_name, "");
    _builder.newLineIfNotEmpty();
    String _xifexpression = null;
    EList<Binding> _bindings = out.getBindings();
    int _size = _bindings.size();
    boolean _greaterThan = (_size > 0);
    if (_greaterThan) {
      EList<Binding> _bindings_1 = out.getBindings();
      final Function1<Binding, CharSequence> _function = new Function1<Binding, CharSequence>() {
        @Override
        public CharSequence apply(final Binding b) {
          return Mutation.bind(b);
        }
      };
      List<CharSequence> _map = ListExtensions.<Binding, CharSequence>map(_bindings_1, _function);
      String _join = IterableExtensions.join(_map, ",\n");
      _xifexpression = String.format("(%s)", _join);
    } else {
      _xifexpression = "";
    }
    _builder.append(_xifexpression, "");
    _builder.newLineIfNotEmpty();
    return _builder;
  }
  
  public static CharSequence bind(final Binding b) {
    StringConcatenation _builder = new StringConcatenation();
    String _propertyName = b.getPropertyName();
    _builder.append(_propertyName, "");
    _builder.append(" <- ");
    OclExpression _value = b.getValue();
    CharSequence _gen = OCL.gen(_value);
    _builder.append(_gen, "");
    return _builder;
  }
  
  public static CharSequence rule(final ModuleElement e) {
    if (e instanceof MatchedRule) {
      return _rule((MatchedRule)e);
    } else if (e != null) {
      return _rule(e);
    } else {
      throw new IllegalArgumentException("Unhandled parameter types: " +
        Arrays.<Object>asList(e).toString());
    }
  }
}
