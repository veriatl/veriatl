package fr.emn.atlanmod.veriatl.debug.decomposer.datastructure;

import java.util.ArrayList;

//TODO disj
public enum TriBoolean {
	TRUE {
		@Override
		public TriBoolean disj(TriBoolean op) {
			return UNKNOWN;
		}

		@Override
		public TriBoolean conj(TriBoolean op) {
			if (op == TRUE) {
				return TRUE;
			} else if (op == FALSE) {
				return FALSE;
			} else {
				return UNKNOWN;
			}
		}
	},
	FALSE {
		@Override
		public TriBoolean disj(TriBoolean op) {
			return UNKNOWN;
		}

		@Override
		public TriBoolean conj(TriBoolean op) {
			return FALSE;
		}
	},
	UNKNOWN {
		@Override
		public TriBoolean disj(TriBoolean op) {
			return UNKNOWN;
		}

		@Override
		public TriBoolean conj(TriBoolean op) {
			if (op == FALSE) {
				return FALSE;
			} else {
				return UNKNOWN;
			} 
		}
	};

	public abstract TriBoolean disj(TriBoolean op);

	public abstract TriBoolean conj(TriBoolean op);

	public static TriBoolean compute(ArrayList<Node> nodes) {
		TriBoolean res;
		if (nodes.size() == 0) {
			return UNKNOWN;
		} else {
			res = nodes.get(0).getResult();

			for (Node n : nodes.subList(1, nodes.size())) {
				res = res.conj(n.getResult());
			}

		}

		return res;
	}

}
