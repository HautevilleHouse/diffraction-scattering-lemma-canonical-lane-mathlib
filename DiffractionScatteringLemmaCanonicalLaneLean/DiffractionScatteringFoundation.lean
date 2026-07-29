import DiffractionScatteringLemmaCanonicalLaneLean.ScatteringTheorem

/-!
# Diffraction Scattering Foundation Package
-/

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure DiffractionScatteringFoundation where
  greenFunction : GreenFunctionPackage
  greenFunctionEvidence : GreenFunctionEvidence greenFunction
  integralEquation : IntegralEquationPackage greenFunction
  integralEquationEvidence : IntegralEquationEvidence integralEquation
  farField : FarFieldAsymptoticsPackage integralEquation
  farFieldEvidence : FarFieldAsymptoticsEvidence farField
  radiationCondition : RadiationConditionPackage farField
  radiationConditionEvidence : RadiationConditionEvidence radiationCondition
  scatteringTheorem : ScatteringTheoremPackage radiationCondition
  scatteringTheoremEvidence : ScatteringTheoremEvidence scatteringTheorem

def DiffractionScatteringFoundationClosed (A : DiffractionScatteringFoundation) : Prop :=
  GreenFunctionClosed A.greenFunction ∧
  IntegralEquationClosed A.integralEquation ∧
  FarFieldAsymptoticsClosed A.farField ∧
  RadiationConditionClosed A.radiationCondition ∧
  ScatteringTheoremClosed A.scatteringTheorem

theorem diffraction_scattering_foundation_closed_from_evidence (A : DiffractionScatteringFoundation) :
    DiffractionScatteringFoundationClosed A := by
  exact And.intro (green_function_closed_from_evidence A.greenFunction A.greenFunctionEvidence)
    (And.intro (integral_equation_closed_from_evidence A.integralEquation A.integralEquationEvidence)
      (And.intro (far_field_asymptotics_closed_from_evidence A.farField A.farFieldEvidence)
        (And.intro (radiation_condition_closed_from_evidence A.radiationCondition A.radiationConditionEvidence)
          (scattering_theorem_closed_from_evidence A.scatteringTheorem A.scatteringTheoremEvidence))))

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse