import DiffractionScatteringLemmaCanonicalLaneLean.RadiationCondition

/-!
# Scattering Theorem Package
-/

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure ScatteringTheoremPackage {G : GreenFunctionPackage} {I : IntegralEquationPackage G}
    {F : FarFieldAsymptoticsPackage I} {R : RadiationConditionPackage F} where
  scatteringAmplitudeUniqueness : Prop
  farFieldReconstruction : Prop
  inverseScatteringCompatibility : Prop
  wellPosedness : Prop

structure ScatteringTheoremEvidence {G : GreenFunctionPackage} {I : IntegralEquationPackage G}
    {F : FarFieldAsymptoticsPackage I} {R : RadiationConditionPackage F}
    (S : ScatteringTheoremPackage R) where
  scatteringAmplitudeUniquenessClosed : S.scatteringAmplitudeUniqueness
  farFieldReconstructionClosed : S.farFieldReconstruction
  inverseScatteringCompatibilityClosed : S.inverseScatteringCompatibility
  wellPosednessClosed : S.wellPosedness

def ScatteringTheoremClosed {G : GreenFunctionPackage} {I : IntegralEquationPackage G}
    {F : FarFieldAsymptoticsPackage I} {R : RadiationConditionPackage F}
    (S : ScatteringTheoremPackage R) : Prop :=
  S.scatteringAmplitudeUniqueness ∧ S.farFieldReconstruction ∧
  S.inverseScatteringCompatibility ∧ S.wellPosedness

theorem scattering_theorem_closed_from_evidence {G : GreenFunctionPackage} {I : IntegralEquationPackage G}
    {F : FarFieldAsymptoticsPackage I} {R : RadiationConditionPackage F}
    (S : ScatteringTheoremPackage R) (E : ScatteringTheoremEvidence S) :
    ScatteringTheoremClosed S := by
  exact And.intro E.scatteringAmplitudeUniquenessClosed
    (And.intro E.farFieldReconstructionClosed
      (And.intro E.inverseScatteringCompatibilityClosed E.wellPosednessClosed))

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse