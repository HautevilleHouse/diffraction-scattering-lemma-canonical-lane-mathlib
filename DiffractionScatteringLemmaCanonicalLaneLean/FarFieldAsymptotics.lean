import DiffractionScatteringLemmaCanonicalLaneLean.IntegralEquationFormulation

/-!
# Far-Field Asymptotics Package
-/

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure FarFieldAsymptoticsPackage {G : GreenFunctionPackage} {I : IntegralEquationPackage G} where
  stationaryPhaseApproximation : Prop
  scatteringAmplitudeFormula : Prop
  farFieldPatternAngularDependence : Prop
  radiationCondition : Prop

structure FarFieldAsymptoticsEvidence {G : GreenFunctionPackage} {I : IntegralEquationPackage G}
    (F : FarFieldAsymptoticsPackage I) where
  stationaryPhaseApproximationClosed : F.stationaryPhaseApproximation
  scatteringAmplitudeFormulaClosed : F.scatteringAmplitudeFormula
  farFieldPatternAngularDependenceClosed : F.farFieldPatternAngularDependence
  radiationConditionClosed : F.radiationCondition

def FarFieldAsymptoticsClosed {G : GreenFunctionPackage} {I : IntegralEquationPackage G}
    (F : FarFieldAsymptoticsPackage I) : Prop :=
  F.stationaryPhaseApproximation ∧ F.scatteringAmplitudeFormula ∧
  F.farFieldPatternAngularDependence ∧ F.radiationCondition

theorem far_field_asymptotics_closed_from_evidence {G : GreenFunctionPackage} {I : IntegralEquationPackage G}
    (F : FarFieldAsymptoticsPackage I) (E : FarFieldAsymptoticsEvidence F) :
    FarFieldAsymptoticsClosed F := by
  exact And.intro E.stationaryPhaseApproximationClosed
    (And.intro E.scatteringAmplitudeFormulaClosed
      (And.intro E.farFieldPatternAngularDependenceClosed E.radiationConditionClosed))

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse