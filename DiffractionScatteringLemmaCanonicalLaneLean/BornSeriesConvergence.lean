import canonicalLaneMathlib.AdmissibleClass
import .ScatteringAdmittedObject

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure BornSeriesConvergencePackage (O : ScatteringAdmittedObject) where
  bornSeriesFormal : Prop
  strongConvergence : Prop
  weakConvergence : Prop
  errorEstimates : Prop
  highEnergyAsymptotics : Prop

structure BornSeriesConvergenceEvidence (O : ScatteringAdmittedObject) (B : BornSeriesConvergencePackage O) where
  bornSeriesFormalClosed : B.bornSeriesFormal
  strongConvergenceClosed : B.strongConvergence
  weakConvergenceClosed : B.weakConvergence
  errorEstimatesClosed : B.errorEstimates
  highEnergyAsymptoticsClosed : B.highEnergyAsymptotics

def BornSeriesConvergenceClosed (O : ScatteringAdmittedObject) (B : BornSeriesConvergencePackage O) : Prop :=
  B.bornSeriesFormal ∧ B.strongConvergence ∧ B.weakConvergence ∧ B.errorEstimates ∧ B.highEnergyAsymptotics

theorem born_series_convergence_closed_from_evidence (O : ScatteringAdmittedObject) (B : BornSeriesConvergencePackage O) (E : BornSeriesConvergenceEvidence O B) :
    BornSeriesConvergenceClosed O B := by
  exact And.intro E.bornSeriesFormalClosed
    (And.intro E.strongConvergenceClosed
      (And.intro E.weakConvergenceClosed
        (And.intro E.errorEstimatesClosed E.highEnergyAsymptoticsClosed)))

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse