// 붙혀넣기 비활성화
// Reference link
//https://stackoverflow.com/questions/60148518/can-we-disable-copy-paste-options-of-textfield-in-swiftui
import SwiftUI

struct CustomeTextField: View {

    @State var textStr = ""


    var body: some View {
        VStack(spacing: 10) {
            Text("This is textfield:")
                .font(.body)
                .foregroundColor(.gray)

            TextFieldWrapperView(text: self.$textStr)
                .background(Color.gray)
                .frame(width: 200, height: 50)
        }
        .frame(height: 40)
    }
}


struct TextFieldWrapperView: UIViewRepresentable {

    @Binding var text: String

    func makeCoordinator() -> TFCoordinator {
        TFCoordinator(self)
    }
}

extension TextFieldWrapperView {


    func makeUIView(context: UIViewRepresentableContext<TextFieldWrapperView>) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        return textField
    }


    func updateUIView(_ uiView: UITextField, context: Context) {

    }
}

class TFCoordinator: NSObject, UITextFieldDelegate {
    var parent: TextFieldWrapperView

    init(_ textField: TextFieldWrapperView) {
        self.parent = textField
    }

    func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return canPerformAction(action: action, withSender: sender)
    }
}