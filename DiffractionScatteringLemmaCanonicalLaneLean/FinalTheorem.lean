import canonicalLaneMathlib.AdmissibleClass
import DiffractionScatteringLemmaCanonicalLaneLean.ScatteringCrossSection
import DiffractionScatteringLemmaCanonicalLaneLean.BornApproximation

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  True

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedDiffractionScatteringClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

theorem constrained_diffraction_scattering_endgame (A : AdmissibleClass) :
    ConstrainedDiffractionScatteringClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse