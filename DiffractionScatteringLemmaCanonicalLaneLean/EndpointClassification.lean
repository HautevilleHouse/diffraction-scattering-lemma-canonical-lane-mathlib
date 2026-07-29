import canonicalLaneMathlib.AdmissibleClass
import .ScatteringAdmittedObject
import .DiffractionTheorem

namespace HautevilleHouse
namespace DiffractionScatteringLemmaCanonicalLaneLean

structure EndpointClassificationPackage (O : ScatteringAdmittedObject) (D : DiffractionTheoremPackage O) where
  farFieldRecognized : Prop
  scatteringAmplitudeClosedForm : Prop
  asymptoticExpansion : Prop
  endpointMatchesScatteringLemma : Prop

structure EndpointClassificationEvidence (O : ScatteringAdmittedObject) (D : DiffractionTheoremPackage O) (E : EndpointClassificationPackage O D) where
  farFieldRecognizedClosed : E.farFieldRecognized
  scatteringAmplitudeClosedFormClosed : E.scatteringAmplitudeClosedForm
  asymptoticExpansionClosed : E.asymptoticExpansion
  endpointMatchesScatteringLemmaClosed : E.endpointMatchesScatteringLemma

def EndpointClassificationClosed (O : ScatteringAdmittedObject) (D : DiffractionTheoremPackage O) (E : EndpointClassificationPackage O D) : Prop :=
  E.farFieldRecognized ∧ E.scatteringAmplitudeClosedForm ∧ E.asymptoticExpansion ∧ E.endpointMatchesScatteringLemma

theorem endpoint_classification_closed_from_evidence (O : ScatteringAdmittedObject) (D : DiffractionTheoremPackage O) (E : EndpointClassificationPackage O D) (Ev : EndpointClassificationEvidence O D E) :
    EndpointClassificationClosed O D E := by
  exact And.intro Ev.farFieldRecognizedClosed
    (And.intro Ev.scatteringAmplitudeClosedFormClosed
      (And.intro Ev.asymptoticExpansionClosed Ev.endpointMatchesScatteringLemmaClosed))

end DiffractionScatteringLemmaCanonicalLaneLean
end HautevilleHouse