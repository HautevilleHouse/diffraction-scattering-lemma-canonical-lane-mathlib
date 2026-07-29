import canonicalLaneMathlib.AdmissibleClass
import .ScatteringAdmittedObject
import .ScatteringCrossSection
import .HelmholtzReduction
import .BornSeriesConvergence

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure DiffractionTheoremPackage (O : ScatteringAdmittedObject) where
  crossSection : ScatteringCrossSectionPackage O
  helmholtz : HelmholtzReductionPackage O
  bornSeries : BornSeriesConvergencePackage O
  reciprocityTheorem : Prop
  diffractionLemmaStatement : Prop
  endpointConclusion : Prop

structure DiffractionTheoremEvidence (O : ScatteringAdmittedObject) (D : DiffractionTheoremPackage O) where
  crossSectionClosed : ScatteringCrossSectionClosed O D.crossSection
  helmholtzClosed : HelmholtzReductionClosed O D.helmholtz
  bornSeriesClosed : BornSeriesConvergenceClosed O D.bornSeries
  reciprocityTheoremClosed : D.reciprocityTheorem
  diffractionLemmaStatementClosed : D.diffractionLemmaStatement
  endpointConclusionClosed : D.endpointConclusion

def DiffractionTheoremClosed (O : ScatteringAdmittedObject) (D : DiffractionTheoremPackage O) : Prop :=
  ScatteringCrossSectionClosed O D.crossSection ∧ HelmholtzReductionClosed O D.helmholtz ∧ BornSeriesConvergenceClosed O D.bornSeries ∧ D.reciprocityTheorem ∧ D.diffractionLemmaStatement ∧ D.endpointConclusion

theorem diffraction_theorem_closed_from_evidence (O : ScatteringAdmittedObject) (D : DiffractionTheoremPackage O) (E : DiffractionTheoremEvidence O D) :
    DiffractionTheoremClosed O D := by
  exact And.intro E.crossSectionClosed
    (And.intro E.helmholtzClosed
      (And.intro E.bornSeriesClosed
        (And.intro E.reciprocityTheoremClosed
          (And.intro E.diffractionLemmaStatementClosed E.endpointConclusionClosed))))

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse