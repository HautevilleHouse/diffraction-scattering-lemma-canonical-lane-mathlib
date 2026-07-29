import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure DiffractionPatternPackage where
  incomingDirection : Type u
  outgoingDirection : Type v
  patternFunction : incomingDirection -> outgoingDirection -> ℂ
  fraunhoferCondition : Prop
  fresnelCondition : Prop
  interferenceTerms : Prop

structure DiffractionPatternEvidence (D : DiffractionPatternPackage) where
  fraunhoferConditionClosed : D.fraunhoferCondition
  fresnelConditionClosed : D.fresnelCondition
  interferenceTermsClosed : D.interferenceTerms

def DiffractionPatternClosed (D : DiffractionPatternPackage) : Prop :=
  D.fraunhoferCondition ∧ D.fresnelCondition ∧ D.interferenceTerms

theorem diffraction_pattern_closed_from_evidence
    (D : DiffractionPatternPackage) (E : DiffractionPatternEvidence D) :
    DiffractionPatternClosed D := by
  exact And.intro E.fraunhoferConditionClosed
    (And.intro E.fresnelConditionClosed E.interferenceTermsClosed)

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse