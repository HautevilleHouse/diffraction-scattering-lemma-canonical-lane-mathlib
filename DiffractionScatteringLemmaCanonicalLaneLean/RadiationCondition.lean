import DiffractionScatteringLemmaCanonicalLaneLean.FarFieldAsymptotics

/-!
# Radiation Condition Package
-/

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure RadiationConditionPackage {G : GreenFunctionPackage} {I : IntegralEquationPackage G}
    {F : FarFieldAsymptoticsPackage I} where
  sommerfeldCondition : Prop
  uniquenessOutgoing : Prop
  limitingAbsorptionPrinciple : Prop
  reciprocity : Prop

structure RadiationConditionEvidence {G : GreenFunctionPackage} {I : IntegralEquationPackage G}
    {F : FarFieldAsymptoticsPackage I} (R : RadiationConditionPackage F) where
  sommerfeldConditionClosed : R.sommerfeldCondition
  uniquenessOutgoingClosed : R.uniquenessOutgoing
  limitingAbsorptionPrincipleClosed : R.limitingAbsorptionPrinciple
  reciprocityClosed : R.reciprocity

def RadiationConditionClosed {G : GreenFunctionPackage} {I : IntegralEquationPackage G}
    {F : FarFieldAsymptoticsPackage I} (R : RadiationConditionPackage F) : Prop :=
  R.sommerfeldCondition ∧ R.uniquenessOutgoing ∧ R.limitingAbsorptionPrinciple ∧ R.reciprocity

theorem radiation_condition_closed_from_evidence {G : GreenFunctionPackage} {I : IntegralEquationPackage G}
    {F : FarFieldAsymptoticsPackage I} (R : RadiationConditionPackage F)
    (E : RadiationConditionEvidence R) : RadiationConditionClosed R := by
  exact And.intro E.sommerfeldConditionClosed
    (And.intro E.uniquenessOutgoingClosed
      (And.intro E.limitingAbsorptionPrincipleClosed E.reciprocityClosed))

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse