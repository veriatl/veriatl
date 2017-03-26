package fr.emn.atlanmod.veriatl.experiment.mutation.core;

import fr.emn.atlanmod.veriatl.experiment.mutation.datastructure.Add;
import fr.emn.atlanmod.veriatl.experiment.mutation.datastructure.Bind;
import fr.emn.atlanmod.veriatl.experiment.mutation.datastructure.SetGuard;
import fr.emn.atlanmod.veriatl.experiment.mutation.generator.Mutation;
import fr.emn.atlanmod.veriatl.experiment.mutation.util.EMFUtil;
import fr.emn.atlanmod.veriatl.experiment.mutation.util.URIs;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.io.FileUtils;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl;
import org.eclipse.m2m.atl.common.ATL.ATLPackage;
import org.eclipse.m2m.atl.common.ATL.MatchedRule;
import org.eclipse.m2m.atl.common.ATL.Module;
import org.eclipse.m2m.atl.common.ATL.ModuleElement;
import org.eclipse.m2m.atl.common.OCL.OclModel;
import org.eclipse.m2m.atl.emftvm.compiler.AtlResourceFactoryImpl;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ListExtensions;

@SuppressWarnings("all")
public class StandAlone {
  private final static String basePath = "./resources/";
  
  private final static String proj = "UML2UMLs.atl";
  
  private final static String src = "UML.ecore";
  
  private static EPackage srcmm;
  
  private static ArrayList<String> ids = new ArrayList<String>();
  
  public static void main(final String[] args) {
    StandAlone.doEMFSetup();
    final ResourceSetImpl rs = new ResourceSetImpl();
    String _format = String.format("%s/%s", StandAlone.basePath, StandAlone.proj);
    final URI atl = URI.createFileURI(_format);
    final Resource atl_resource = rs.getResource(atl, true);
    ArrayList<MatchedRule> rules = new ArrayList<MatchedRule>();
    Module module = null;
    EList<EObject> _contents = atl_resource.getContents();
    for (final EObject e : _contents) {
      if ((e instanceof Module)) {
        module = ((Module)e);
        EList<OclModel> _inModels = ((Module)e).getInModels();
        OclModel _get = _inModels.get(0);
        OclModel _metamodel = _get.getMetamodel();
        String _name = _metamodel.getName();
        Mutation.src = _name;
        EList<OclModel> _outModels = ((Module)e).getOutModels();
        OclModel _get_1 = _outModels.get(0);
        OclModel _metamodel_1 = _get_1.getMetamodel();
        String _name_1 = _metamodel_1.getName();
        Mutation.trg = _name_1;
        EList<ModuleElement> _elements = ((Module)e).getElements();
        for (final ModuleElement o : _elements) {
          if ((o instanceof MatchedRule)) {
            rules.add(((MatchedRule)o));
          }
        }
      }
    }
    for (final MatchedRule r : rules) {
      {
        final int pos = rules.indexOf(r);
        StandAlone.del(module, r, pos);
      }
    }
    final Function1<String, String> _function = new Function1<String, String>() {
      @Override
      public String apply(final String id) {
        return String.format("\"%s\"", id);
      }
    };
    List<String> _map = ListExtensions.<String, String>map(StandAlone.ids, _function);
    final String s = IterableExtensions.join(_map, ",");
    InputOutput.<String>println(s);
  }
  
  public static boolean add(final Module module, final MatchedRule r, final int pos) {
    try {
      boolean _xblockexpression = false;
      {
        Add _add = new Add(r);
        final MatchedRule mutant = _add.apply();
        final String id = String.format("AR%03d", Integer.valueOf(pos));
        String _format = String.format("%s/%s/Source/%s", StandAlone.basePath, id, StandAlone.proj);
        final URI outPath = URI.createFileURI(_format);
        String _Add = Mutation.Add(module, r, mutant);
        URIs.write(outPath, _Add);
        final String srcCache = String.format("%s/UML2UMLs/Source/", StandAlone.basePath);
        final String dstCache = String.format("%s/%s/Source/", StandAlone.basePath, id);
        File _file = new File(srcCache);
        File _file_1 = new File(dstCache);
        FileUtils.copyDirectory(_file, _file_1);
        String _name = mutant.getName();
        String _format_1 = String.format("result.put(\"%s\", \"%s\");", id, _name);
        InputOutput.<String>println(_format_1);
        _xblockexpression = StandAlone.ids.add(id);
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public static boolean del(final Module module, final MatchedRule r, final int pos) {
    try {
      boolean _xblockexpression = false;
      {
        final String id = String.format("DR%03d", Integer.valueOf(pos));
        String _format = String.format("%s/%s/Source/%s", StandAlone.basePath, id, StandAlone.proj);
        final URI outPath = URI.createFileURI(_format);
        String _Del = Mutation.Del(module, r);
        URIs.write(outPath, _Del);
        final String srcCache = String.format("%s/UML2UMLs/Source/", StandAlone.basePath);
        final String dstCache = String.format("%s/%s/Source/", StandAlone.basePath, id);
        File _file = new File(srcCache);
        File _file_1 = new File(dstCache);
        FileUtils.copyDirectory(_file, _file_1);
        String _name = r.getName();
        String _format_1 = String.format("result.put(\"%s\", \"%s\");", id, _name);
        InputOutput.<String>println(_format_1);
        _xblockexpression = StandAlone.ids.add(id);
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public static void filter(final Module module, final MatchedRule r, final int pos) {
    try {
      SetGuard _setGuard = new SetGuard(r);
      final ArrayList<MatchedRule> mutants = _setGuard.apply(StandAlone.srcmm);
      int i = 0;
      for (final MatchedRule mutant : mutants) {
        {
          if ((i == 0)) {
            final int mpos = mutants.indexOf(mutant);
            final String id = String.format("MF%03d_%03d", Integer.valueOf(pos), Integer.valueOf(mpos));
            String _format = String.format("%s/%s/Source/%s", StandAlone.basePath, id, StandAlone.proj);
            final URI outPath = URI.createFileURI(_format);
            String _SetGuard = Mutation.SetGuard(module, r, mutant);
            URIs.write(outPath, _SetGuard);
            final String srcCache = String.format("%s/UML2UMLs/Source/", StandAlone.basePath);
            final String dstCache = String.format("%s/%s/Source/", StandAlone.basePath, id);
            File _file = new File(srcCache);
            File _file_1 = new File(dstCache);
            FileUtils.copyDirectory(_file, _file_1);
            String _name = r.getName();
            String _format_1 = String.format("result.put(\"%s\", \"%s\");", id, _name);
            InputOutput.<String>println(_format_1);
            StandAlone.ids.add(id);
          }
          i++;
        }
      }
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public static void bind(final Module module, final MatchedRule r, final int pos) {
    try {
      Bind _bind = new Bind(r);
      final ArrayList<MatchedRule> mutants = _bind.apply();
      int i = 0;
      for (final MatchedRule mutant : mutants) {
        {
          if ((i == 0)) {
            final int mpos = mutants.indexOf(mutant);
            final String id = String.format("MB%03d_%03d", Integer.valueOf(pos), Integer.valueOf(mpos));
            String _format = String.format("%s/%s/Source/%s", StandAlone.basePath, id, StandAlone.proj);
            final URI outPath = URI.createFileURI(_format);
            String _Bind = Mutation.Bind(module, r, mutant);
            URIs.write(outPath, _Bind);
            final String srcCache = String.format("%s/UML2UMLs/Source/", StandAlone.basePath);
            final String dstCache = String.format("%s/%s/Source/", StandAlone.basePath, id);
            File _file = new File(srcCache);
            File _file_1 = new File(dstCache);
            FileUtils.copyDirectory(_file, _file_1);
            String _name = r.getName();
            String _format_1 = String.format("result.put(\"%s\", \"%s\");", id, _name);
            InputOutput.<String>println(_format_1);
            StandAlone.ids.add(id);
          }
          i++;
        }
      }
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public static EPackage doEMFSetup() {
    EPackage _xblockexpression = null;
    {
      EPackage.Registry.INSTANCE.put(ATLPackage.eNS_URI, ATLPackage.eINSTANCE);
      Map<String, Object> _extensionToFactoryMap = Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap();
      AtlResourceFactoryImpl _atlResourceFactoryImpl = new AtlResourceFactoryImpl();
      _extensionToFactoryMap.put("atl", _atlResourceFactoryImpl);
      Map<String, Object> _extensionToFactoryMap_1 = Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap();
      EcoreResourceFactoryImpl _ecoreResourceFactoryImpl = new EcoreResourceFactoryImpl();
      _extensionToFactoryMap_1.put("ecore", _ecoreResourceFactoryImpl);
      String _format = String.format("%s/%s", StandAlone.basePath, StandAlone.src);
      URI _createFileURI = URI.createFileURI(_format);
      EPackage _ePackage = EMFUtil.getEPackage(_createFileURI);
      _xblockexpression = StandAlone.srcmm = _ePackage;
    }
    return _xblockexpression;
  }
}
