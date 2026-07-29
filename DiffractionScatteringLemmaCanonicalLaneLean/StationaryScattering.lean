import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure StationaryScatteringPackage where
  energyParameter : Type u
  scatteringMatrix : Type v
  sMatrixUnitary : Prop
  analyticContinuation : Prop
  thresholdBehavior : Prop

structure StationaryScatteringEvidence (S : StationaryScatteringPackage) where
  sMatrixUnitaryClosed : S.sMatrixUnitary
  analyticContinuationClosed : S.analyticContinuation
  thresholdBehaviorClosed : S.thresholdBehavior

def StationaryScatteringClosed (S : StationaryScatteringPackage) : Prop :=
  S.sMatrixUnitary ∧ S.analyticContinuation ∧ S.thresholdBehavior

theorem stationary_scattering_closed_from_evidence
    (S : StationaryScatteringPackage) (E : StationaryScatteringEvidence S) :
    StationaryScatteringClosed S := by
  exact And.intro E.sMatrixUnitaryClosed
    (And.intro E.analyticContinuationClosed E.thresholdBehaviorClosed)

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse