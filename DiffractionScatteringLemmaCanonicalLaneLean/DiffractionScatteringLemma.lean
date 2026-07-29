import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

/-!
  Diffraction Scattering Lemma: The main lemma connecting diffraction patterns
  to scattering amplitudes in the stationary regime.
-/
structure DiffractionScatteringLemmaPackage where
  scatteringAmplitude : ScatteringAmplitudePackage
  diffractionPattern : DiffractionPatternPackage
  lemmaStatement : Prop
  holographicRelation : Prop
  highEnergyLimit : Prop

structure DiffractionScatteringLemmaEvidence
    (D : DiffractionScatteringLemmaPackage) where
  lemmaStatementClosed : D.lemmaStatement
  holographicRelationClosed : D.holographicRelation
  highEnergyLimitClosed : D.highEnergyLimit

def DiffractionScatteringLemmaClosed
    (D : DiffractionScatteringLemmaPackage) : Prop :=
  D.lemmaStatement ∧ D.holographicRelation ∧ D.highEnergyLimit

theorem diffraction_scattering_lemma_closed_from_evidence
    (D : DiffractionScatteringLemmaPackage)
    (E : DiffractionScatteringLemmaEvidence D) :
    DiffractionScatteringLemmaClosed D := by
  exact And.intro E.lemmaStatementClosed
    (And.intro E.holographicRelationClosed E.highEnergyLimitClosed)

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse