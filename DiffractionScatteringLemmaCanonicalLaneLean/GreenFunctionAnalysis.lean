import DiffractionScatteringLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Green Function Analysis Package
-/

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure GreenFunctionPackage where
  freeSpaceGreen : Prop
  halfSpaceGreen : Prop
  farFieldAsymptotics : Prop
  singularityHandling : Prop

structure GreenFunctionEvidence (G : GreenFunctionPackage) where
  freeSpaceGreenClosed : G.freeSpaceGreen
  halfSpaceGreenClosed : G.halfSpaceGreen
  farFieldAsymptoticsClosed : G.farFieldAsymptotics
  singularityHandlingClosed : G.singularityHandling

def GreenFunctionClosed (G : GreenFunctionPackage) : Prop :=
  G.freeSpaceGreen ∧ G.halfSpaceGreen ∧ G.farFieldAsymptotics ∧ G.singularityHandling

theorem green_function_closed_from_evidence (G : GreenFunctionPackage) (E : GreenFunctionEvidence G) :
    GreenFunctionClosed G := by
  exact And.intro E.freeSpaceGreenClosed
    (And.intro E.halfSpaceGreenClosed
      (And.intro E.farFieldAsymptoticsClosed E.singularityHandlingClosed))

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse