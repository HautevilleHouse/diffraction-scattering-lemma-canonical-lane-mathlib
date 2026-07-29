import DiffractionScatteringLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def scatteringProjection : Projection ScatteringEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem scattering_projection_idempotent (x : ScatteringEndgameState) :
    scatteringProjection.toFun (scatteringProjection.toFun x) = scatteringProjection.toFun x := by
  exact scatteringProjection.idempotent x

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse