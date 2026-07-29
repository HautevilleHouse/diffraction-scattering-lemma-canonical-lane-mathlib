import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure ScatteringSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ScatteringAdmittedObject where
  space : ScatteringSpace
  incidentWave : Prop
  scatteredField : Prop
  farFieldPattern : Prop
  conclusion : farFieldPattern

structure ScatteringEndgameState where
  object : ScatteringAdmittedObject

def ScatteringWitnessClosed (O : ScatteringAdmittedObject) : Prop :=
  O.farFieldPattern

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse