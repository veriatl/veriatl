import subprocess
from os import walk
import sys
from datetime import datetime
import time

# global settings start
# VERIFICATION OPTION ON PROJECTS
_OPT_VERIFICATION = 1		# CORRECTNESS VERIFICATION
_OPT_VALIDATION = 2			# TRANSLATION VALIDITON
_OPT_VERIFICATION_ORG = 3	# CORRECTNESS VERIFICATION FOR ORIGINAL POSTCONDITION

LibsPath = "Prelude/"		# imported library path
mmPath = "Auxu/"			# imported metamodel path
genByPath = "Sub-goals/genBy.bpl"
taskPath = ""
taskPaths = [
"/Sub-goals/fsm_state_multi_lower/",
"/Sub-goals/fsm_transition_multi_lower/",
"/Sub-goals/fsm_transition_src_multi_lower/",
"/Sub-goals/fsm_transition_trg_multi_lower/",
"/Sub-goals/unique_fsm_sm_names/",
"/Sub-goals/unique_fsm_state_names/",
]



# PROJ PATH


Proj0 = "HSM2FSM/"			# task 1
Proj1 = "MT2/"			# task 1
Proj2 = "DB1/"			# task 2
Proj3 = "MB6/"			# task 3
Proj4 = "AF2/"			# task 4
Proj5 = "MF6/"			# task 5
Proj6 = "DR1/"			# task 6
Proj7 = "AR/"			# task 7






# PROJ TO VERIFY
Projs = [Proj0,
Proj1,Proj2,Proj3,Proj4,
Proj5,Proj6,Proj7
]	

# WHAT OPTION TO VERIFY EACH PROJ
Projs_option_map = { 
Proj0: { _OPT_VERIFICATION_ORG},
Proj1: { _OPT_VERIFICATION_ORG},
Proj2: { _OPT_VERIFICATION_ORG},
Proj3: { _OPT_VERIFICATION_ORG},
Proj4: { _OPT_VERIFICATION_ORG},
Proj5: { _OPT_VERIFICATION_ORG},
Proj6: { _OPT_VERIFICATION_ORG},
Proj7: { _OPT_VERIFICATION_ORG}
}

# BOOGIE ARGS


# global settings end

# forge the cmd that executes Boogie, depending on the [option] that pass in, which stores at task_option_map.
def forgeRunningCommand(projPath, taskName, option):
	command = []

	command.append("boogie")					# command
	

	
	
	
	for libName in loadFiles(LibsPath):
		command.append(LibsPath+libName)		# importing library

	
	for fN in loadFiles(projPath+mmPath):
		command.append(projPath+mmPath+fN)				# import metamodel related Boogie code

	
	if taskName.startswith("case") and option == _OPT_VERIFICATION:
		command.append(projPath+taskPath+taskName)	# input
		command.append(projPath+genByPath)
	elif taskName.startswith("or") and option == _OPT_VERIFICATION_ORG:
		command.append(projPath+taskPath+taskName)
	else:
		command = []
	
	
	
	return command


	
def loadFiles(path):
	
	f = []
	for (dirpath, dirnames, filenames) in walk(path):
		f.extend(filenames)
		break
	
	return f



def BatchTest(isDetailed):

	sum = 0;
	
	global taskPath
	for proj in Projs:
		sum = 0;
		for opt in Projs_option_map[proj]:
			
			for tp in taskPaths:
				taskPath = tp
				tasks = loadFiles(proj+taskPath)	
				
				for task in tasks:
					myCmd = forgeRunningCommand(proj, task, opt)
					
					if myCmd != []:
						start = int(round(time.time() * 1000))
						p = subprocess.Popen(myCmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE) 
						p.wait()
						done = int(round(time.time() * 1000))
						out, err = p.communicate()

						elapsed = done - start
						sum+=elapsed
						
						if(str(out).find(", 0 errors") == -1):
							#print("[%s]:[%s]:[%s]:[%s]:%s:%s" % (proj, tp, task, opt, "unverified", str(elapsed)))
							sys.stdout.flush()
							
							
							tSub = 0
							subNum = 0
							UnverifiedSubs = 0
							max = 0;
							
							for task in tasks:
								myCmd = forgeRunningCommand(proj, task, _OPT_VERIFICATION)
					
								if myCmd != []:
									startSub = int(round(time.time() * 1000))
									
									p = subprocess.Popen(myCmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
									p.wait()
									doneSub = int(round(time.time() * 1000))
									elapsedSub = doneSub - startSub
									out, err = p.communicate()

									
									tSub+=elapsedSub
									subNum += 1
									if(max<elapsedSub):
										max = elapsedSub
									
									
									if(str(out).find(", 0 errors") == -1):
										UnverifiedSubs += 1
										#print("\t[%s]:[%s]:[%s]:[%s]:%s:%s" % (proj, tp, task, opt, "unverified", str(elapsedSub)))
										sys.stdout.flush()
									else:
										#print("\t[%s]:[%s]:[%s]:[%s]:%s:%s" % (proj, tp, task, opt, "verified", str(elapsedSub)))
										sys.stdout.flush()
							sum+=tSub
							#print("\t"+str(tSub))
							print("[%s]:[%s]:[%s]" % (proj, tp, task))
							print("\tOrg:[%s];Total:[%s];Unverified:[%s];Avg:[%s];Max:[%s]" % (elapsed, subNum, UnverifiedSubs, round(tSub/subNum), max))
										
						else:
							#print("[%s]:[%s]:[%s]:[%s]:%s:%s" % (proj, tp, task, opt, "verified", str(elapsed)))
							sys.stdout.flush()
				
					
			#print(sum)
	


	
def main():
	i = datetime.now()
	
	BatchTest(True)
	
	
	

if __name__ == "__main__":
    main()
	
	
