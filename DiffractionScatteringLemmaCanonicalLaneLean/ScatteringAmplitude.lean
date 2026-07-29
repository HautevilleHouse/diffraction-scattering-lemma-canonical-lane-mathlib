import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure ScatteringAmplitudePackage where
  incidentWaveVector : Type u
  scatteredWaveVector : Type v
  amplitudeFunction : incidentWaveVector -> scatteredWaveVector -> ℂ
  unitarityCondition : Prop
  reciprocityCondition : Prop
  analyticContinuation : Prop

structure ScatteringAmplitudeEvidence (S : ScatteringAmplitudePackage) where
  unitarityConditionClosed : S.unitarityCondition
  reciprocityConditionClosed : S.reciprocityCondition
  analyticContinuationClosed : S.analyticContinuation

def ScatteringAmplitudeClosed (S : ScatteringAmplitudePackage) : Prop :=
  S.unitarityCondition ∧ S.reciprocityCondition ∧ S.analyticContinuation

theorem scattering_amplitude_closed_from_evidence
    (S : ScatteringAmplitudePackage) (E : ScatteringAmplitudeEvidence S) :
    ScatteringAmplitudeClosed S := by
  exact And.intro E.unitarityConditionClosed
    (And.intro E.reciprocityConditionClosed E.analyticContinuationClosed)

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse