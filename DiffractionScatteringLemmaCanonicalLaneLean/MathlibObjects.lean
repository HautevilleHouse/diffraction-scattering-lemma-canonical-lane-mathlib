import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ScatteringSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ScatteringAdmittedObject where
  space : ScatteringSpace
  compactlySupported : Prop
  incoming : Prop
  outgoing : Prop
  scatteringModel : Type
  scatteringTopology : TopologicalSpace scatteringModel
  scatteringEnergyFinite : Prop
  conclusion : scatteringEnergyFinite

structure ScatteringEndgameState where
  object : ScatteringAdmittedObject

def ScatteringWitnessClosed (O : ScatteringAdmittedObject) : Prop :=
  O.scatteringEnergyFinite

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse