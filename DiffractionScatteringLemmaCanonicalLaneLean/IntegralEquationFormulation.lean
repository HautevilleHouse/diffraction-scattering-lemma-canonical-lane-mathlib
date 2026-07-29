import DiffractionScatteringLemmaCanonicalLaneLean.GreenFunctionAnalysis

/-!
# Integral Equation Formulation Package
-/

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure IntegralEquationPackage {G : GreenFunctionPackage} where
  boundaryIntegralEquation : Prop
  surfaceCurrentDensity : Prop
  incidentWaveExcitation : Prop
  scatteredFieldRepresentation : Prop

structure IntegralEquationEvidence {G : GreenFunctionPackage} (I : IntegralEquationPackage G) where
  boundaryIntegralEquationClosed : I.boundaryIntegralEquation
  surfaceCurrentDensityClosed : I.surfaceCurrentDensity
  incidentWaveExcitationClosed : I.incidentWaveExcitation
  scatteredFieldRepresentationClosed : I.scatteredFieldRepresentation

def IntegralEquationClosed {G : GreenFunctionPackage} (I : IntegralEquationPackage G) : Prop :=
  I.boundaryIntegralEquation ∧ I.surfaceCurrentDensity ∧ I.incidentWaveExcitation ∧ I.scatteredFieldRepresentation

theorem integral_equation_closed_from_evidence {G : GreenFunctionPackage} (I : IntegralEquationPackage G)
    (E : IntegralEquationEvidence I) : IntegralEquationClosed I := by
  exact And.intro E.boundaryIntegralEquationClosed
    (And.intro E.surfaceCurrentDensityClosed
      (And.intro E.incidentWaveExcitationClosed E.scatteredFieldRepresentationClosed))

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse