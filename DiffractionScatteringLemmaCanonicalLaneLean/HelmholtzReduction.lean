import canonicalLaneMathlib.AdmissibleClass
import .ScatteringAdmittedObject

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure HelmholtzReductionPackage (O : ScatteringAdmittedObject) where
  waveEquationReduction : Prop
  outgoingRadiationCondition : Prop
  sommerfeldRadiationCondition : Prop
  weakFormulation : Prop
  greenFunctionRepresentation : Prop

structure HelmholtzReductionEvidence (O : ScatteringAdmittedObject) (H : HelmholtzReductionPackage O) where
  waveEquationReductionClosed : H.waveEquationReduction
  outgoingRadiationConditionClosed : H.outgoingRadiationCondition
  sommerfeldRadiationConditionClosed : H.sommerfeldRadiationCondition
  weakFormulationClosed : H.weakFormulation
  greenFunctionRepresentationClosed : H.greenFunctionRepresentation

def HelmholtzReductionClosed (O : ScatteringAdmittedObject) (H : HelmholtzReductionPackage O) : Prop :=
  H.waveEquationReduction ∧ H.outgoingRadiationCondition ∧ H.sommerfeldRadiationCondition ∧ H.weakFormulation ∧ H.greenFunctionRepresentation

theorem helmholtz_reduction_closed_from_evidence (O : ScatteringAdmittedObject) (H : HelmholtzReductionPackage O) (E : HelmholtzReductionEvidence O H) :
    HelmholtzReductionClosed O H := by
  exact And.intro E.waveEquationReductionClosed
    (And.intro E.outgoingRadiationConditionClosed
      (And.intro E.sommerfeldRadiationConditionClosed
        (And.intro E.weakFormulationClosed E.greenFunctionRepresentationClosed)))

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse