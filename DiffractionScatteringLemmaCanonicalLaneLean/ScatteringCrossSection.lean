import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure ScatteringCrossSectionPackage where
  incidentWaveVector : Type u
  scatteringAngle : Type v
  differentialCrossSection : Prop
  totalCrossSection : Prop
  opticalTheoremRelation : Prop

structure ScatteringCrossSectionEvidence (S : ScatteringCrossSectionPackage) where
  differentialCrossSectionClosed : S.differentialCrossSection
  totalCrossSectionClosed : S.totalCrossSection
  opticalTheoremRelationClosed : S.opticalTheoremRelation

def ScatteringCrossSectionClosed (S : ScatteringCrossSectionPackage) : Prop :=
  S.differentialCrossSection ∧ S.totalCrossSection ∧ S.opticalTheoremRelation

theorem scattering_cross_section_closed_from_evidence
    (S : ScatteringCrossSectionPackage) (E : ScatteringCrossSectionEvidence S) :
    ScatteringCrossSectionClosed S := by
  exact And.intro E.differentialCrossSectionClosed
    (And.intro E.totalCrossSectionClosed E.opticalTheoremRelationClosed)

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse