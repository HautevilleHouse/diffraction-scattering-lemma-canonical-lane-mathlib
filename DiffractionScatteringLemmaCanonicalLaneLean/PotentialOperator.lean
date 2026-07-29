import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure PotentialOperatorPackage where
  potentialFunction : Type u -> Type v
  decayCondition : Prop
  smoothnessCondition : Prop
  compactSupport : Prop
  operatorBoundedness : Prop

structure PotentialOperatorEvidence (P : PotentialOperatorPackage) where
  decayConditionClosed : P.decayCondition
  smoothnessConditionClosed : P.smoothnessCondition
  compactSupportClosed : P.compactSupport
  operatorBoundednessClosed : P.operatorBoundedness

def PotentialOperatorClosed (P : PotentialOperatorPackage) : Prop :=
  P.decayCondition ∧ P.smoothnessCondition ∧ P.compactSupport ∧ P.operatorBoundedness

theorem potential_operator_closed_from_evidence
    (P : PotentialOperatorPackage) (E : PotentialOperatorEvidence P) :
    PotentialOperatorClosed P := by
  exact And.intro E.decayConditionClosed
    (And.intro E.smoothnessConditionClosed
      (And.intro E.compactSupportClosed E.operatorBoundednessClosed))

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse