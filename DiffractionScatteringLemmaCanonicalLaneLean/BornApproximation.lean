import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure BornApproximationPackage where
  scatteringPotential : Type u
  firstOrderCorrection : Prop
  highEnergyLimit : Prop
  weakScatteringRegime : Prop

structure BornApproximationEvidence (B : BornApproximationPackage) where
  firstOrderCorrectionClosed : B.firstOrderCorrection
  highEnergyLimitClosed : B.highEnergyLimit
  weakScatteringRegimeClosed : B.weakScatteringRegime

def BornApproximationClosed (B : BornApproximationPackage) : Prop :=
  B.firstOrderCorrection ∧ B.highEnergyLimit ∧ B.weakScatteringRegime

theorem born_approximation_closed_from_evidence
    (B : BornApproximationPackage) (E : BornApproximationEvidence B) :
    BornApproximationClosed B := by
  exact And.intro E.firstOrderCorrectionClosed
    (And.intro E.highEnergyLimitClosed E.weakScatteringRegimeClosed)

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse