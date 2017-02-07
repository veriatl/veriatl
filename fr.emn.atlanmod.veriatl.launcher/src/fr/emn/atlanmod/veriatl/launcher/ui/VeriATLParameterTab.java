package fr.emn.atlanmod.veriatl.launcher.ui;

import org.eclipse.core.resources.IFile;
import org.eclipse.core.runtime.CoreException;
import org.eclipse.debug.core.ILaunchConfiguration;
import org.eclipse.debug.core.ILaunchConfigurationWorkingCopy;
import org.eclipse.debug.ui.AbstractLaunchConfigurationTab;
import org.eclipse.jface.dialogs.Dialog;
import org.eclipse.m2m.atl.adt.ui.common.WorkspaceFileDialog;
import org.eclipse.swt.SWT;
import org.eclipse.swt.custom.ScrolledComposite;
import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Group;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Text;

import fr.emn.atlanmod.veriatl.core.Mode;
import fr.emn.atlanmod.veriatl.launcher.VeriATLLaunchConstants;

public class VeriATLParameterTab extends AbstractLaunchConfigurationTab {

	private Button exec;
    private Button gen;
    private Button verify;
    private Button debug;
    
    private Text location;
    
    private Group modeGroup;
    private Group contractGroup;
    
    @Override
    public void createControl(Composite parent) {
        ScrolledComposite scrollContainer = new ScrolledComposite(parent, SWT.H_SCROLL | SWT.V_SCROLL);
        scrollContainer.setExpandHorizontal(true);
        scrollContainer.setExpandVertical(true);

        Composite rootContainer = new Composite(scrollContainer, SWT.NULL);
        rootContainer.setLayout(new GridLayout());
        scrollContainer.setContent(rootContainer);

        modeGroup = new Group(rootContainer, SWT.NULL);
        modeGroup.setLayoutData(new GridData(GridData.FILL_HORIZONTAL));
        modeGroup.setLayout(new GridLayout(4, false));
        modeGroup.setText("Verification Mode");

        contractGroup = new Group(rootContainer, SWT.NULL);
        contractGroup.setLayoutData(new GridData(GridData.FILL_HORIZONTAL));
        contractGroup.setLayout(new GridLayout(4, false));
        contractGroup.setText("Contract");
        
        buildModeGroup();
        buildContractControls();
        
        setControl(scrollContainer);
    }

    /**
	 * Add 4 buttons for modes in {@code modeGroup}} 
	 */
	private void buildModeGroup() {
		exec = new Button(modeGroup, SWT.RADIO);
        exec.setText(Mode.EXEC.getName());
        exec.addSelectionListener(new SelectionAdapter() {
            @Override
            public void widgetSelected(SelectionEvent e) {
                updateLaunchConfigurationDialog();
            }
        });
        
        gen = new Button(modeGroup, SWT.RADIO);
        gen.setText(Mode.GEN.getName());
        gen.addSelectionListener(new SelectionAdapter() {
            @Override
            public void widgetSelected(SelectionEvent e) {
                updateLaunchConfigurationDialog();
            }
        });

        verify = new Button(modeGroup, SWT.RADIO);
        verify.setText(Mode.VERIFY.getName());
        verify.addSelectionListener(new SelectionAdapter() {
            @Override
            public void widgetSelected(SelectionEvent e) {
                updateLaunchConfigurationDialog();
            }
        });

        debug = new Button(modeGroup, SWT.RADIO);
        debug.setText(Mode.DEBUG.getName());
        debug.addSelectionListener(new SelectionAdapter() {
            @Override
            public void widgetSelected(SelectionEvent e) {
                updateLaunchConfigurationDialog();
            }
        });
		
	}

	
	private void buildContractControls() {

		final Label metamodelLabel = new Label(contractGroup, SWT.NULL);
		metamodelLabel.setText("Path:"); //$NON-NLS-1$

		location = new Text(contractGroup, SWT.BORDER);
		location.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, true, false, 6, 1));
		

		

		final Button browseWorkspace = new Button(contractGroup, SWT.NULL);
		browseWorkspace.setText("Workspace...");
		browseWorkspace.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent evt) {
				final WorkspaceFileDialog dialog = new WorkspaceFileDialog(getShell(), (String[])null);
				final Object result = dialog.open() == Dialog.OK ? dialog.getFirstResult() : null;
				if ((result != null) && (result instanceof IFile)) {
					final IFile currentFile = (IFile)result;
					final String path = currentFile.getFullPath().toString();
					location.setText("platform:/resource" + path);
					updateLaunchConfigurationDialog();
				}
			}
		});


		final Label filler = new Label(contractGroup, SWT.NULL);
		filler.setLayoutData(new GridData(SWT.NULL, SWT.NULL, false, false, 3, 1));

		

	}
	
	
	
	@Override
    public void setDefaults(ILaunchConfigurationWorkingCopy configuration) {
        configuration.setAttribute(Mode.EXEC.getName(), true);
        configuration.setAttribute(Mode.GEN.getName(), false);
        configuration.setAttribute(Mode.VERIFY.getName(), false);
        configuration.setAttribute(Mode.DEBUG.getName(), false);
    }

    @Override
    public void initializeFrom(ILaunchConfiguration configuration) {
        try {
            exec.setSelection(configuration.getAttribute(Mode.EXEC.getName(), false));
            gen.setSelection(configuration.getAttribute(Mode.GEN.getName(), true));
            verify.setSelection(configuration.getAttribute(Mode.VERIFY.getName(), false));
            debug.setSelection(configuration.getAttribute(Mode.DEBUG.getName(), false));
            
            location.setText(configuration.getAttribute(VeriATLLaunchConstants.CONTRACT_PATH, VeriATLLaunchConstants.STRING_DEFAULT));
        }
        catch (CoreException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void performApply(ILaunchConfigurationWorkingCopy configuration) {
        configuration.setAttribute(Mode.EXEC.getName(), exec.getSelection());
        configuration.setAttribute(Mode.GEN.getName(), gen.getSelection());
        configuration.setAttribute(Mode.VERIFY.getName(), verify.getSelection());
        configuration.setAttribute(Mode.DEBUG.getName(), debug.getSelection());
        
        configuration.setAttribute(VeriATLLaunchConstants.CONTRACT_PATH, location.getText());
    }

    @Override
    public String getName() {
        return "VeriATL";
    }

    @Override
    // TODO Set the tab icon
    public Image getImage() {
        return super.getImage();
//        return ImageDescriptor.createFromURL();
    }
}
