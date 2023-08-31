import SwiftUI
import Combine

@available(iOS 15, *)
public struct OtpView_SwiftUI: View {
    
    //MARK: Fields
    enum FocusField: Hashable {
        case field
    }
    @FocusState private var focusedField: FocusField?
    @Binding var otpCode: String
    var otpCodeLength: Int
    var textColor: Color
    var textSize: CGFloat
    var completion: () -> Void
    //MARK: Constructor
    public init(otpCode: Binding<String>, otpCodeLength: Int, textColor: Color, textSize: CGFloat,completion: @escaping () -> Void) {
        self._otpCode = otpCode
        self.otpCodeLength = otpCodeLength
        self.textColor = textColor
        self.textSize = textSize
        self.completion = completion
    }
    
    //MARK: Body
    public var body: some View {
        HStack {
            ZStack(alignment: .center) {
                TextField("", text: $otpCode)
                    .frame(width: 0, height: 0, alignment: .center)
                    .font(Font.system(size: 0))
                    .accentColor(.clear)
                    .foregroundColor(.clear)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .onReceive(Just(otpCode)) { newValue in
                        limitText(otpCodeLength)
                        if otpCode.count == otpCodeLength{
                            self.completion()
                        }
                        
                    }
                    .focused($focusedField, equals: .field)
                    .task {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                        {
                            self.focusedField = .field
                        }
                    }
                    .padding()
                HStack {
                    Spacer()
                    ForEach(0..<otpCodeLength, id: \.self) { index in
                        ZStack {
                            Text(self.getPin(at: index))
                                .font(Font.system(size: textSize))
                                .fontWeight(.semibold)
                                .foregroundColor(textColor)
                            Rectangle()
                                .fill(Color.clear)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 29)
                                            .stroke(.gray, lineWidth: 1)
                                    )
                        }
                    }.frame(width: 58, height: 58)
                    Spacer()
                }
            }
        }
    }
    
    //MARK: func
    private func getPin(at index: Int) -> String {
        guard self.otpCode.count > index else {
            return ""
        }
        return self.otpCode[index]
    }
    
    private func limitText(_ upper: Int) {
        if otpCode.count > upper {
            otpCode = String(otpCode.prefix(upper))
        }
    }
}

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}
